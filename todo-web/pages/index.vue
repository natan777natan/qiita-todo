<template>
  <div v-if="user">
    <p>{{ user.name }}</p>
    <AddTodo @submit="addTodo" />
    <TodoList :todos="user.todos" />
  </div>
</template>

<script>
import AddTodo from "@/components/AddTodo";
import TodoList from "@/components/TodoList";
import axios from "@/plugins/axios";

export default {
  components: {
    AddTodo,
    TodoList
  },
  data() {
    return {};
  },
  computed: {
    user() {
      return this.$store.state.currentUser;
    },
    error() {
      return this.$store.state.errors;
    }
  },
  fetch({ store, redirect }) {
    store.watch(
      state => state.currentUser,
      (newUser, oldUser) => {
        console.log({ newUser });
        if (!newUser) {
          return redirect("/login");
        }
      }
    );
  },
  methods: {
    async addTodo(todo) {
      const { data } = await axios.post("/v1/todos", { todo });
      //追加
      this.$store.commit("setUser", {
        ...this.user,
        todos: [...this.user.todos, data]
      });
    }
  }
};
</script>

<style></style>
