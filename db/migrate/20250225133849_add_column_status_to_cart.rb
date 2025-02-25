class AddColumnStatusToCart < ActiveRecord::Migration[8.0]
  def change
    column_exists?(:carts, :status) || add_column(:carts, :status, :string)
  end
end
