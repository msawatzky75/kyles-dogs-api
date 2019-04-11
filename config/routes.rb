# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :v1 do
    resources :cart_items
    resources :orders
    resources :order_items
    resources :payments
    resources :invoices
    resources :invoice_status_codes
    resources :users
    resources :pages
    resources :products
    resources :product_categories
    resources :product_status_codes
  end
  get '*unmatched_route', to: 'application#raise_not_found'
end
