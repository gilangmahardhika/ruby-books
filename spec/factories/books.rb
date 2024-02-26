FactoryBot.define do
  factory :book do
    title { "MyString" }
    isbn { "" }
    description { "MyText" }
    author { nil }
  end
end
