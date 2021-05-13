FactoryBot.define do
  factory :item do
    name               {Faker::Food.dish}
    text               {Faker::Food.description}
    category_id        {rand(1..10)}
    status_id          {rand(1..6)}
    burden_id          {rand(1..10)}
    prefecture_id      {rand(1..47)}
    day_id             {rand(1..3)}
    price              {rand(300..9999999)}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
