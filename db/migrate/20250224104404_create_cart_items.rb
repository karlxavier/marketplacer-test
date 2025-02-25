class CreateCartItems < ActiveRecord::Migration[8.0]
  def change
    create_table :cart_items do |t|
      t.references :cart, null: false, foreign_key: true
      t.integer :quantity, default: 1
      t.decimal :product_price, precision: 15, scale: 2
      t.decimal :line_total, precision: 15, scale: 2
      t.string :product_uuid

      t.timestamps
    end
  end
end
