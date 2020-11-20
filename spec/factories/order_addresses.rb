FactoryBot.define do
  factory :order_address do
    postal_number { '123-4567' }
    prefectural_id { 3 }
    municipality {'市区町村'}
    address { '番地' }
    building_name { '東京ハイツ' }
    phone_number { '1234567' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
