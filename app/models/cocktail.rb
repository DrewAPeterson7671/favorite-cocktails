class Cocktail < ApplicationRecord
  belongs_to :user

  require 'httparty'


  def self.api_call
    @drinks = HTTParty.get('http://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita')
    # json = JSON.parse(response.body)
    # json['url']
  end

end
