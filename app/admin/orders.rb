ActiveAdmin.register Order do
  permit_params :date, :user_id, :order_item_id
end
