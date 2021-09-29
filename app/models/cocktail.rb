require 'uri'
require 'open-uri'

class Cocktail < ApplicationRecord
  belongs_to :user
  has_one_attached :cocktail_photo
  
  validates :name, presence: true
  validates :instructions, presence: true
  validates :ingredient1, presence: true
  validates_length_of :instructions, maximum: 500
  validates_length_of :ingredient1, maximum: 50
  validates_length_of :measure1, maximum: 50
  
  def self.capture_api_image(cocktail)
    filename = File.basename(URI.parse(cocktail.api_image_url).path)
    file = URI.open(cocktail.api_image_url)
    cocktail.cocktail_photo.attach(io: file, filename: filename, content_type: 'image/jpg')    
  end

end
