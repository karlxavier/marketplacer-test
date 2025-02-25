class CartItem < ApplicationRecord
  belongs_to :cart

  validates :product_uuid, presence: true

  before_validation :update_line_total
  after_save :update_cart_total
  after_destroy :update_cart_total

  def product
    @product ||= Product.find_by_uuid(product_uuid)
  end

  private

  def update_line_total
    self.product_price = product.price
    self.line_total = self.product_price * self.quantity
  end

  def update_cart_total
    cart.calculate_discounts
    cart.save
  end
end
