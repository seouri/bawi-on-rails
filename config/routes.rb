BawiOnRails::Application.routes.draw do
  resources :groups
  resources :boards do
    resources :articles
  end
  devise_for :users
  root :to => "users#index"
end
