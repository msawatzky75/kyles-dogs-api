class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.reference :user
      t.reference :product

      t.timestamps
    end
  end
end
