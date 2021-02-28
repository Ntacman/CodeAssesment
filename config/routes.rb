Rails.application.routes.draw do
  resources :orders
  resources :inventories
  resources :products
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'products#index'
end
