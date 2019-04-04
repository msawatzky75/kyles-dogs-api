# frozen_string_literal: true

ActiveAdmin.register ProductCategory do
  permit_params :name, :description
end
