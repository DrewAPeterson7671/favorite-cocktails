class PagesController < ApplicationController
  require 'json'
  require '../../lib/drink'

  def search
    render :search
  end
end