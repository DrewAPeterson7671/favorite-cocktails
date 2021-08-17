class PagesController < ApplicationController

  def search
    @search = params[:search]
    api_call = Drinks.new(@search)
    response = api_call.drink_name
    @drinks = JSON(response.body)

    render :search
  end
end