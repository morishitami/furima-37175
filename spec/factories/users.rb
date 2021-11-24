FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name}
    end

    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password {password}
    password_confiamation {password}
    lastname { person.last.kanji}
    firstname {person.first.kanji}
    lastname_kana {person.last.katakana}
    firstname_kana {person.first.katakana}
    birthday { Faker::Date.backward }
  end
end

#email以外はfakerじゃなくても良かったかも