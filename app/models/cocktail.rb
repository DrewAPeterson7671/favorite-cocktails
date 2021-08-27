class Cocktail < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :category, presence: true
  validates :instructions, presence: true
  validates :ingredients, presence: true
  validates_length_of :instructions, maximum: 500
  validates_length_of :ingredients, maximum: 300

end
