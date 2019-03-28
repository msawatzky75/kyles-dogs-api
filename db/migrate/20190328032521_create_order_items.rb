class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :price
      t.integer :quantity
      t.references :product

      t.timestamps
    end
  end
end
