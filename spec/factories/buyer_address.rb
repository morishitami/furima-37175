FactoryBot.define do
  factory :buyer_address do
    postal_code {'123-4567'}
    state_id {2}
    city {'札幌市'}
    line1 {'1-2'}
    line2 {'build'}
    phone {'12345678901'}
    token {"tok_asdfghjklzx00000000000000000"}
  end
end
