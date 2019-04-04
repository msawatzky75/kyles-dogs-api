# frozen_string_literal: true

ActiveAdmin.register InvoiceStatusCode do
  permit_params :name, :description
end
