FactoryBot.define do
  factory :item do
    name { '仮商品名' }
    description { 'これは説明文です。' }
    category_id { 2 }
    item_condition_id { 2 }
    shipping_cost_status_id { 2 }
    prefecture_id { 2 }
    shipping_schedule_id { 2 }
    price { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
