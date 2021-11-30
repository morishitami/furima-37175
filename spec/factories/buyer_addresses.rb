FactoryBot.define do
  factory :buyer_address do
    postal_code {'123-4567'}
    state_id {2}
    city {'札幌市'}
    line1 {'1-2'}
    line2 {'build'}
    phone {'090-1234-5678'}
  end
end
