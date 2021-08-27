FactoryBot.define do
  factory :item do
    after (:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    item_name       {Faker::Commerce.product_name}
    info            {Faker::Lorem.sentence}
    category_id     {1}
    condition_id    {1}
    sipping_cost_id {1}
    prefectures_id  {1}
    sipping_day_id  {1}
    price           {3000}
    association :user

  end
end
