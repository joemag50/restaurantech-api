Rails.application.routes.draw do
  resources :order_products
  resources :orders
  resources :products
  devise_for :users
  root 'static_pages#home'
  get :app, to: 'static_pages#app'
end
