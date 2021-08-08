Given('I have populated a cocktail list for this User') do
  FactoryBot.create(:cocktail,
                      :user => @registered_user,
                      :name => "Frank Wallbanger",
                      :ingredients => "Lots of Booze, a pinch of lime")
  FactoryBot.create(:cocktail,
                      :user => @registered_user,
                      :name => "Fuzzy Naval Orange",
                      :ingredients => "Lots of Tequila, a pinch of orange")
end

When('I visit the website and log in') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I will see the cocktail list') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I add a new cocktail to my favorites list') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see the new cocktail in the list') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('I have a cocktail in the intentory') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I want to change an existing cocktail') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see the change in my list') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('I have a cocktail in my list') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I delete the cocktail') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I do not find it in my list') do
  pending # Write code here that turns the phrase above into concrete actions
end
