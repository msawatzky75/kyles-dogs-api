Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :cart_items
  resources :orders
  resources :order_items
  resources :payments
  resources :invoices
  resources :invoice_status_codes
  resources :users
  resources :products
  resources :product_categories
  resources :product_status_codes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
