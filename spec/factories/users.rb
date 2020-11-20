FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 3)}
    email                 {Faker::Internet.email}
    password              {"111aaa"}
    password_confirmation {password}
    birthday              {"1932-01-02"}
    gender                {0}
  end
end
