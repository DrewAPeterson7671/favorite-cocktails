require 'drinks'

class PagesController < ApplicationController

  before_action :authenticate_user!, :only =>[:search, :search_results]

  def home
    render :home
  end

  def search
    render :search
  end

  def search_results
    @search = params[:search]
    api_call = Drink.new(@search.strip)
    response = api_call.drink_name
    api_error_handler(response)
    render :search_results
  end
  
  private
  
  def api_error_handler(response)
    @drinks = JSON(response.body)
    if @drinks["drinks"].blank?
      flash[:alert] = "We couldn't find that cocktail"
      return @drinks = {}
    end

    case response.code
    when 200
      flash[:alert] = "Search Complete"
    when 404
      flash[:alert] = "Sorry, That cocktail wasn't found."
      @drinks = {}
    when 400..403
      flash[:alert] = "Error #{response.code}"
      @drinks = {}
    when 405..499
      flash[:alert] = "Error #{response.code}"
      @drinks = {}
    when 500..600
      flash[:alert] = "Server Error #{response.code}.  Please try again a little later."
      @drinks = {}
    else
      flash[:alert] = "Unknown Error"
      @drinks = {}
    end
  end
end