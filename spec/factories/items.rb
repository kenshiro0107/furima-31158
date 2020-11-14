FactoryBot.define do
  factory :item do
    name                  { Faker::Internet.free_email }
    info                  { Faker::Internet.password(min_length: 6) }
    category_id           { 2 }
    status_id             { 2 }
    delivery_fee_id       { 2 }
    prefectual_id         { 2 }
    shipping_days_id      { 2 }
    price                 { 3000 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open(
        'public/images/test_image.png'
      ), filename: 'test_image.png')
    end
  end
end
