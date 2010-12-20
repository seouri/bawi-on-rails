BawiOnRails::Application.routes.draw do
  resources :groups do
    resources :boards
  end
  resources :boards do
    resources :articles do
      member do
        get :thread
        get :reply
      end
      resources :comments
    end
  end
  devise_for :users
  resources :users
  root :to => "groups#index"
end
