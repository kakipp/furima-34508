FactoryBot.define do
    factory :user do
        transient do
            person { Gimei.name }
        end
        
        nick_name {Faker::Name.last_name}
        email {Faker::Internet.free_email}
        password = "abc123"
        password {password}
        password_confirmation {password}
        first_name {person.first.kanji}
        last_name {person.last.kanji}
        first_name_furigana{person.first.katakana}
        last_name_furigana{person.last.katakana}
        birth_day {Faker::Date.backward}

    end
  end