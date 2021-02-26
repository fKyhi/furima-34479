FactoryBot.define do
  factory :item do
    image {Faker::Lorem.sentence}
    name {'aaa'}
    explain {'aaa'}
    category_id { Category.all.sample }
    state_id { State.all.sample }
    shipping_fee_status_id { Shipping_fee_status.all.sample }
    prefecture_id { Prefecture.all.sample }
    scheduled_delivery_id { Scheduled_delivery.all.sample }
    price { }

  end
end
