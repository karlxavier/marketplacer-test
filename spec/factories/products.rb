FactoryBot.define do
  factory :product do
    uuid { SecureRandom.uuid }
    name { Faker::App.name }
    price { rand(10.0..100.0).round(2) }

    initialize_with { new(attributes) }
  end
end
