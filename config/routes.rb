Rails.application.routes.draw do
  root to: "users#index", as: 'root'

  devise_for :users do 
    get '/users/sign_out' => 'devise/sessions#destroy' 
  end

  get "/users/:user_id", to: "users#show", as: 'user'

  get "/users/:user_id/posts", to: "posts#index", as: 'posts'
  get "/users/:user_id/posts/new", to: "posts#new", as: 'new_post'
  post "/users/:user_id/posts", to: "posts#create"
  get "/users/:user_id/posts/:post_id", to: "posts#show", as: 'post'
  delete "/users/:user_id/posts/:post_id", to: "posts#destroy", as: 'post_delete'
  
  get "/users/:user_id/posts/:post_id/comments", to: "comments#index", as: 'comments'
  get "/users/:user_id/posts/:post_id/comments/new", to: "comments#new", as: 'new_comment'
  post "/users/:user_id/posts/:post_id/comments", to: "comments#create"
  delete "/users/:user_id/posts/:post_id/comments/:comment_id", to: "comments#destroy", as: 'post_comment_delete'

  post "/users/:user_id/posts/:post_id/likes", to: "likes#create", as: 'likes'
end
