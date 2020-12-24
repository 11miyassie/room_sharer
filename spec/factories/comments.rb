FactoryBot.define do
  factory :comment do
    text { 'テキスト' }

    association :user
    association :post
  end
end
