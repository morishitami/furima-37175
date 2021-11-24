FactoryBot.define do
  factory :user do

    nickname {'test'}
    email {Faker::Internet.free_email}
    password {'a12345'}
    password_confirmation {password}
    lastname {'てす'}
    firstname {'と'}
    lastname_kana {'テス'}
    firstname_kana {'ト'}
    birthday {'1930-12-1'}
  end
end