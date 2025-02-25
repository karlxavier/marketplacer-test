class Cart < ApplicationRecord
  belongs_to :user
  has_many :discount_transactions, as: :discountable
  has_many :discount_rules, through: :discount_transactions
  has_many :cart_items, dependent: :destroy

  before_save :calculate_discounts

  include AASM

  aasm whiny_transitions: false, column: :status do
    state :open, initial: true
    state :checkout
  end

  def products
    @products ||= self.cart_items.map(&:product)
  end

  def discount_messages
    discount_rules.pluck(:message)
  end

  def calculate_discounts
    Discount::Issuer.new(transaction: self).calculate!
  end
end
