Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :users, only:[:show]
  resources :categories, only:[:index, :show]
  resources :items do
    resources :purchases, only:[:index, :create]
    resource :likes, only:[:create, :destroy]
  end
end
