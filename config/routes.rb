Newsful::Application.routes.draw do
  resources :votes
  resources :posts do 
    resources :comments
  end

  devise_for :users, :admins

  root :to => 'posts#index'
end
