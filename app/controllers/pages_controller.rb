class PagesController < ApplicationController
  def search
    @drinks = HTTParty.get('http://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita')
  end
end