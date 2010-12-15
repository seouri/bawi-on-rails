BawiOnRails::Application.routes.draw do
  resources :groups
  resources :boards do
    resources :articles
  end
  devise_for :users
  resources :users
  root :to => "users#index"
end