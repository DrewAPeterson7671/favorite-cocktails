require 'httparty'



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
# test1 = Drinks.new("martini")
# puts test1.drink_name