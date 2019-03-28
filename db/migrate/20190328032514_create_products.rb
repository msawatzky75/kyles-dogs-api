class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.reference :product_status_code
      t.reference :product_category

      t.timestamps
    end
  end
end
