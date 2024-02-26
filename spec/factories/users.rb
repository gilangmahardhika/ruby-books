FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    username { Faker::Artist.name }
  end
end
