Rails.application.routes.draw do
  resources :categories
  resources :order_products
  resources :orders
  resources :products
  devise_for :users
  root 'static_pages#home'
  get :app, to: 'static_pages#app'

  namespace :api do
    get :categories
    get :products_category
    get :products

    get :new_order_product

    get :new_order
    get :cancel_order
    get :order
  end
end
