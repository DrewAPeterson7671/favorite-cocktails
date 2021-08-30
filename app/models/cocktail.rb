require 'uri'
require 'open-uri'

class Cocktail < ApplicationRecord
  belongs_to :user
  has_one_attached :cocktail_photo
  
  validates :name, presence: true
  validates :category, presence: true
  validates :instructions, presence: true
  validates :ingredient1, presence: true
  validates_length_of :instructions, maximum: 500
  # validates :cocktail_photo, { 
  #   presence: true 
  # }
  
  
  def self.capture_api_image(cocktail)
    # "https://www.thecocktaildb.com/images/media/drink/bry4qh1582751040.jpg"
    filename = File.basename(URI.parse(cocktail.api_image_url).path)
    file = URI.open(cocktail.api_image_url)
    # medium.image.attach(io: file, filename: filename, content_type: 'image/jpg')
    cocktail.cocktail_photo.attach(io: file, filename: filename, content_type: 'image/jpg')    
    # @cocktail.cocktail_photo.attach(params[:cocktail][:cocktail_photo])
  end

end
