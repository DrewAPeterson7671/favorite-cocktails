require 'httparty'

class Page < ApplicationRecord
  belongs_to :user

  def self.api_call
    @drinks = HTTParty.get('http://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita')
  end

  def self.ingredient_combine(drink)
    i = 1
    combine = []
    while !drink["strIngredient" + i.to_s].nil? do 
      combine.push(drink["strIngredient" + i.to_s])
      if !drink["strMeasure" + i.to_s].nil?
        combine.push(drink["strMeasure" + i.to_s])
      else
        combine.push("")
      end
      i = i + 1
    end
    return combine.join(", ")
  end

end