Rails.application.routes.draw do
  root to: 'items#index'
  resources :item, only:[:edit]
end
