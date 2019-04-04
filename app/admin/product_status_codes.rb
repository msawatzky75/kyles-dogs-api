# frozen_string_literal: true

ActiveAdmin.register ProductStatusCode do
  permit_params :name, :description
end
