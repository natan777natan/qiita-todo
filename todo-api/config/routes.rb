Rails.application.routes.draw do
  namespace :v1 do
    resources :todos, only: [:create, :destroy]
    resources :users, only: [:index, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
