Newsful::Application.routes.draw do
  devise_for :users, :admins

  resources :posts do 
    resources :comments
    resources :votes
  end

  resources :users do
    resources :comments
    resources :votes
  end

  resources :comments do
    resources :votes
  end

  root :to => 'posts#index'
end
