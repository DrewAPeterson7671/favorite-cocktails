Given(/^I have populated a cocktail list for this User$/) do
  FactoryBot.create(:cocktail,
                      :user => @registered_user,
                      :name => "Frank Wallbanger",
                      :ingredient1 => "Booze",
                      :measure1 => "2oz")
  FactoryBot.create(:cocktail,
                      :user => @registered_user,
                      :name => "Fuzzy Naval Orange",
                      :ingredient1 => "Tequila",
                      :measure1 => "Lots")
end

When(/^I visit the website and log in$/) do
  expect(page).to have_content("Signed in successfully")
end

Then('I will see the cocktail list') do
  visit root_path

  expect(page).to have_content("Frank Wallbanger")
  expect(page).to have_content("Fuzzy Naval Orange")
end

When('I add a new cocktail to my favorites list') do
  click_link "New Cocktail"

  fill_in "Name", :with => "Flaming Moe"
  fill_in "Measure 1",	:with => "4 oz" 
  fill_in "Ingredient 1", :with => "Vodka"
  fill_in "Instructions", :with => "Drink"
  select("Cocktail", from: "Category")
  select("Cocktail glass", from: "Glass")

  click_button "Create Cocktail"
end

Then('I should see the new cocktail in the list') do
  visit root_path

  expect(page).to have_content("Flaming Moe")
end

Given('I have a cocktail in the intentory') do
  FactoryBot.create(:cocktail, :user => @registered_user, :name => "Martini", :ingredient1 => "Whiskey", :measure1 => "6 oz")
end

When('I want to change an existing cocktail') do
  visit root_path

  click_link "Edit"

  fill_in "Name", :with => "Mertinini"

  click_button "Update Cocktail"
end

Then('I should see the change in my list') do
  visit root_path

  expect(page).to_not have_content("Martini")
  expect(page).to have_content("Mertinini")
end

Given('I have a cocktail in my list') do
  FactoryBot.create(:cocktail, :user => @registered_user, :name => "Kamikaze", :ingredient1 => "Gin", :measure1 => "5 oz")
end

When('I delete the cocktail') do
  visit root_path
  click_link "Destroy"
end

Then('I do not find it in my list') do
  expect(page).to_not have_content("Kamikaze")
end
