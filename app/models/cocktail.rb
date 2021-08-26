class Cocktail < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :category, presence: true
  validates :alcoholic, presence: true
  validates :instructions, presence: true
  validates :ingredients, presence: true
  validates_length_of :instructions, maximum: 500
  validates_length_of :ingredients, maximum: 300


  require 'httparty'


  def self.api_call
    @drinks = HTTParty.get('http://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita')
    # json = JSON.parse(response.body)
    # json['url']
  end

end
