Rails.application.routes.draw do
  root to: "users#index", as: 'users'
  get "/users/:id", to: "users#show", as: 'user'

  get "/users/:id/posts", to: "posts#index", as: 'posts'
  get "/users/:id/posts/new", to: "posts#new", as: 'new_post'
  get "/users/:id/posts/:id", to: "posts#show", as: 'post'


  # resources :users, only: [:index, :show] do
  #   resources :posts, only: [:index, :show]
  # end
end
