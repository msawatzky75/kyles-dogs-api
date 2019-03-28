class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.references :product_status_code
      t.references :product_category

      t.timestamps
    end
  end
end
