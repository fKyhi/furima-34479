FactoryBot.define do
  factory :purchase_order do
    post_code       { "111-1111" }
    prefecture_id   { 2 }
    city            {"兵庫県"}
    addressed       {"神戸市"}
    building        {"マンション"}
    phone_number    {"00000000000"}
  end
end
