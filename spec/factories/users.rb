FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name}
    end

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

#email以外はfakerじゃなくても良かった ↓未検証
  # nickname {Faker::Name.last_name}
  # email {Faker::Internet.free_email}
  # password = Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)
  # password {password}
  # password_confirmation {password}
  # lastname { person.last.kanji}
  # firstname {person.first.kanji}
  # lastname_kana {person.last.katakana}
  # firstname_kana {person.first.katakana}
  # birthday { Faker::Date.backward }