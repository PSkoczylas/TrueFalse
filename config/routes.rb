Rails.application.routes.draw do
  devise_for :user, :path => '', :path_names => { :sign_in => "login", :sign_up => "register" }

  resources :posts

  root 'posts#index'

  post 'true/:id', to: 'posts#true_answer', as: :true_answer
  post 'false/:id', to: 'posts#false_answer', as: :false_answer

  get 'random_post', to: 'posts#random', as: :random_post
  get '/users/:id', to: 'users#show', as: :show_user
end
