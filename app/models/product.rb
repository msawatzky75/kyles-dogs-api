class Product < ApplicationRecord
  belongs_to :product_category
  belongs_to :product_status_code
  mount_uploader :image, ImageUploader

  def self.search(query)
    if query.nil?
      Product.all
    else
      Product.where(
        product_category: query[:product_category]
      )
    end
  end
end
