FactoryBot.define do
  factory :cart_item do
    association :cart
    quantity { 2 }
    product_price { 20 }
    line_total { 40 }
    product_uuid { "1411" }
  end
end
