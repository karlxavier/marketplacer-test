class DiscountTransaction < ApplicationRecord
  belongs_to :discount_rule
  belongs_to :discountable, polymorphic: true
end
