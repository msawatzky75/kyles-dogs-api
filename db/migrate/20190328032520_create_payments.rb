class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.integer :amount
      t.datetime :date
      t.references :invoice

      t.timestamps
    end
  end
end
