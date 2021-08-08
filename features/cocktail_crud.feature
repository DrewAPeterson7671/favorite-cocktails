Feature: Cocktail CRUD

  In order to find and save my favorite cocktails
  As a user
  I should be able to keep an inventory of the cocktails

Background:
  Given I am a registered user
  And I am logged in

Scenario: Listing the cocktails in the users profile
  Given I have populated a cocktail list for this User
  When I visit the website and log in
  Then I will see the cocktail list

Scenario: Adding new cocktails
  When I add a new cocktail to my favorites list
  Then I should see the new cocktail in the list

Scenario: Updating cocktails
  Given I have a cocktail in the intentory
  When I want to change an existing cocktail
  Then I should see the change in my list

Scenario: Deleting cocktails
  Given I have a cocktail in my list
  When I delete the cocktail
  Then I do not find it in my list 