FactoryBot.define do
  factory :cocktail do
    name { "MyString" }
    ingredients { "MyText" }
    user_id { 1 }
    category { "MyString" }
    glass  { "MyString" }
    instructions { "MyText" }
  end
end
