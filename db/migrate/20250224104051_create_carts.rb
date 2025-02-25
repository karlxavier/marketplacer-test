class CreateCarts < ActiveRecord::Migration[8.0]
  def change
    create_table :carts do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :subtotal, precision: 15, scale: 2
      t.decimal :discount_amount, precision: 15, scale: 2
      t.decimal :total_price, precision: 15, scale: 2

      t.timestamps
    end
  end
end
