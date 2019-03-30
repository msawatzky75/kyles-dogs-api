ActiveAdmin.register Invoice do
  permit_params :date, :invoice_status_code_id
end
