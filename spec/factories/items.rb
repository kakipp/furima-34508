FactoryBot.define do
  factory :item do
    
    name {Faker::Team.name}
    description {Faker::Lorem.sentence}
    delivery_id {2}
    delivery_days_id {2}
    area_id {3}
    status_id {3}
    category_id {3}
    price {1000}
    association :user

    after(:build) do |item|
        item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      end
  end
end
