FactoryBot.define do
  factory :post do
    title            {"物件名"}
    explain          {"物件説明"}
    prefecture_id    {2}
    local            {"地域名"}
    price            {10000}
    building         {"マンション"}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/sample_png.png'), filename: 'sample_png.png')
    end
  end
end
