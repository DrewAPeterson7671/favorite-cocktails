require 'httparty'

class Cocktail < ApplicationRecord
  belongs_to :user

  def self.api_call
    @drinks = HTTParty.get('http://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita')

  end

end