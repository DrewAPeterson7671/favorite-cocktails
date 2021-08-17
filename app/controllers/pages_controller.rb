class PagesController < ApplicationController

  def search
    @search = params[:search]


    render :search
  end
end