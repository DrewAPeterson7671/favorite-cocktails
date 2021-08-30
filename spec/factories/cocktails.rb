FactoryBot.define do
  factory :cocktail do
    name { "MyString" }
    ingredient1 { "MyString" }
    measure1 { "MyString"}
    user_id { 1 }
    category { "MyString" }
    glass  { "MyString" }
    instructions { "MyText" }
  end
end
