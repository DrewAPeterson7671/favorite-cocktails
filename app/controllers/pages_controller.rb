class PagesController < ApplicationController
  require 'json'
  require '../../lib/drink'

  def search
    # response = HTTParty.get('http://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita')
    # @drinks = JSON.parse(response.body)

    
    render :search
  end
end