# frozen_string_literal: true

class OrderItem < ApplicationRecord
  has_one :product
end
