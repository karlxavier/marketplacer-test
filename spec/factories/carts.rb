FactoryBot.define do
  factory :cart do
    association :user
    # subtotal { 150 }
    # discount_amount { 30 }
    # total_price { 120 }
  end
end
