FactoryBot.define do
  factory :purchase_delivery do
    user_id           {""}
    item_id           {""}
    postal_cord       {"100-0000"}
    prefecture_id     { 2 }
    municipality      {"緑区"}
    address           {"箱崎町1-1"}
    building          {"緑ビル"}
    phone_number      {"09012345678"}
    token             {"tok_abcdefghijk00000000000000000"}
  end
end
