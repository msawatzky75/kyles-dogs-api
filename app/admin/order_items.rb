ActiveAdmin.register OrderItem do
  permit_params :price, :quantity, :product_id
end
