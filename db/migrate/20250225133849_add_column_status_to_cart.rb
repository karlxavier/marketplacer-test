class AddColumnStatusToCart < ActiveRecord::Migration[8.0]
  def change
    add_column :carts, :status, :string
  end
end
