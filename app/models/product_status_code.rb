# frozen_string_literal: true

class ProductStatusCode < ApplicationRecord
  has_many :products
end
