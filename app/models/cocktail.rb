class Cocktail < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :category, presence: true
  validates :instructions, presence: true
  validates :ingredient1, presence: true
  validates_length_of :instructions, maximum: 500

end
