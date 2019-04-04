# frozen_string_literal: true

ActiveAdmin.register OrderItem do
  permit_params :price, :quantity, :product_id
end
