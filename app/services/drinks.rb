require 'httparty'
require 'json'

class Drink
  include HTTParty
  base_uri 'http://www.thecocktaildb.com'

  def initialize(name_search)
    @options = { query: { s: name_search } }
    # @flash = flash
  end

  def drink_name
    begin self.class.get("/api/json/v1/1/search.php", @options)
    rescue HTTParty::Error, SocketError => e
      puts('API not avaible, check internet connection')
    # rescue Errno::ECONNREFUSED => error
    #   puts('API not avaible, check internet connection')
    end 
  end

  private

  attr_accessor :name_search, :controller

end


test1 = Drink.new("kamikaze")
response = test1.drink_name
parsed_json = JSON(response.body)





