FactoryBot.define do
  factory :item do
    name                {Faker::Name.initials(number: 2)}
    explanation         {"説明"}
    category_id         {"2"}
    state_id            {"2"}
    delivery_cost_id    {"2"}
    shipment_source_id  {"2"}
    shipping_day_id     {"2"}
    selling_price       { 500 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/elle.jpg'),filename: 'elle.jpg')
    end
  end
end
