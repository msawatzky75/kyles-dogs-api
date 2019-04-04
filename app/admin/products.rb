# frozen_string_literal: true

ActiveAdmin.register Product do
  permit_params :name, :description, :price, :product_status_code_id, :product_category_id, :image
end
