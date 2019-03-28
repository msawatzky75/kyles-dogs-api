class CreateInvoiceStatusCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :invoice_status_codes do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
