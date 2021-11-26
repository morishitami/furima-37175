FactoryBot.define do
  factory :item do
    
    title {'test'}
    explanation {'test'}
    category_id {'2'}
    status_id {'2'}
    postage_id {'2'}
    state_id {'2'}
    day_id {'2'}
    price {'300'}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end
