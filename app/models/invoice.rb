# frozen_string_literal: true

class Invoice < ApplicationRecord
  has_one :invoice_status_code
end
