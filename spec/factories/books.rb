FactoryBot.define do
  factory :book do
    title { "MyString" }
    isbn { "" }
    description { "MyText" }
    author { nil }
    year { 1990 }
  end
end
