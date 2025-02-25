class Cart < ApplicationRecord
  belongs_to :user
  has_many :discount_transactions, as: :discountable
  has_many :cart_items

  before_save :calculate_discounts

  def calculate_discounts
    Discount::Issuer.new(transaction: self).calculate!
  end
end
