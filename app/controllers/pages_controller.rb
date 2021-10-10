require 'drinks'

class PagesController < ApplicationController

  before_action :authenticate_user!, :only =>[:search, :search_results]

  def home
    render :home
  end

  def show
    respond_to do |format|
      format.js
    end
  end

  def search
    if params[:search].blank?
      return
    else
      @search = params[:search]
      api_call = Drink.new(@search.strip)
      response = api_call.drink_name
      api_error_handler(response)
     end
  end
  
  private
  
  def api_error_handler(response)
    @drinks = JSON(response.body)
    if @drinks["drinks"].blank?
      flash.now[:alert] = "We couldn't find that cocktail"
      return @drinks = {}
    end

    case response.code
    when 200
      flash.now[:alert] = "Search Complete"
    when 404
      flash.now[:alert] = "Sorry, That cocktail wasn't found."
      @drinks = {}
    when 400..403
      flash.now[:alert] = "Error #{response.code}"
      @drinks = {}
    when 405..499
      flash.now[:alert] = "Error #{response.code}"
      @drinks = {}
    when 500..600
      flash.now[:alert] = "Server Error #{response.code}.  Please try again a little later."
      @drinks = {}
    else
      flash.now[:alert] = "Unknown Error"
      @drinks = {}
    end
  end
end