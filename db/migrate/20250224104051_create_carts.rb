class CreateCarts < ActiveRecord::Migration[8.0]
  def change
    create_table :carts do |t|
      t.integer :user_id, null: false
      t.decimal :subtotal, precision: 15, scale: 2
      t.decimal :discount_amount, precision: 15, scale: 2
      t.decimal :total_price, precision: 15, scale: 2

      t.timestamps
    end
  end
end
