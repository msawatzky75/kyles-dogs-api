# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :product_category
  belongs_to :product_status_code
  mount_uploader :image, ImageUploader
end
