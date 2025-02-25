class DiscountRule < ApplicationRecord
  scope :active_rules, -> { where(status: true) }
end
