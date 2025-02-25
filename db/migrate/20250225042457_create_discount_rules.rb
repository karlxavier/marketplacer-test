class CreateDiscountRules < ActiveRecord::Migration[8.0]
  def change
    create_table :discount_rules do |t|
      t.jsonb :rules, default: [ {} ]
      t.jsonb :calculations, default: [ {} ]
      t.string :message
      t.string :group_name
      t.boolean :status, default: true
      t.integer :priority, default: 1

      t.timestamps
    end
  end
end
