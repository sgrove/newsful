Newsful::Application.routes.draw do
  resources :votes
  resources :posts do 
    resources :comments
  end

  devise_for :users, :admins

  resources :users do
    resources :comments
  end

  resources :comments

  root :to => 'posts#index'
end
