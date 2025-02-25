class CreateDiscountTransactions < ActiveRecord::Migration[8.0]
  def change
    create_table :discount_transactions do |t|
      t.references :discount_rule, null: false, foreign_key: true
      t.references :discountable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
