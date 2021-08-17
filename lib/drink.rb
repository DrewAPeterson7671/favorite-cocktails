require 'httparty'
require 'json'


class Drinks
  include HTTParty
  base_uri 'http://www.thecocktaildb.com'

  def initialize(name_search)
    @options = { query: { s: name_search } }
  end

  def drink_name
    self.class.get("/api/json/v1/1/search.php", @options)
  end
end

# drinks = Drinks.new("margarita")
# puts drinks.drink_name
test1 = Drinks.new("martini")
response = test1.drink_name

parsed_json = JSON(response.body)
# puts parsed_json.class


# puts parsed_json["drinks"]

# parsed_json["drinks"].each do |item|
#   puts item["strDrink"]
# end




