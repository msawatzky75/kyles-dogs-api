class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.datetime :date
      t.references :invoice_status_code

      t.timestamps
    end
  end
end
