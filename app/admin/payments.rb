# frozen_string_literal: true

ActiveAdmin.register Payment do
  permit_params :amount, :date, :invoice_id
end
