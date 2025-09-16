class Cocktail < ApplicationRecord
  # associations
  # The dependent: :destroy on cocktails deletes associated doses when a cocktail is deleted, but not ingredients.
  has_many :doses, dependent: :destroy # creates a method cocktail.doses ?
  has_many :ingredients, through: :doses 

  #validations
  validates :name, presence: true, uniqueness: true
end
