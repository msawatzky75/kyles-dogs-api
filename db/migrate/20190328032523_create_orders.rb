class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.datetime :date
      t.references :user
      t.references :order_item

      t.timestamps
    end
  end
end
