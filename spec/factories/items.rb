FactoryBot.define do
  factory :item do
    id {1}
    user_id {1}
    name   {Faker::Name.initials(number: 2)}
    detail  {Faker::Name.initials(number: 2)}
    category_id      {2}
    condition_id     {2}
    delivery_fee_id  {2}
    prefecture_id    {2}
    shipping_date_id {2}
    price {300}
    user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/test.png'), filename: 'test_image.png')
    end
  end
end
