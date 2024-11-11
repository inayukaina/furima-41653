FactoryBot.define do
  factory :order_address do
    post_code { '123-1234' }
    prefecture_id { 2 }
    city { '新宿区' }
    address { '1-1' }
    building { '東京ハイツ' }
    phone_number { '09012341234' }
    token { 'tok_abcdefghijk00000000000000000' }
    association :user
    association :item
  end
end
