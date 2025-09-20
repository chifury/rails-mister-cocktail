class Cocktail < ApplicationRecord
  # associations
  # The dependent: :destroy on cocktails deletes associated doses when a cocktail is deleted, but not ingredients.
  has_many :doses, dependent: :destroy # creates a method cocktail.doses
  has_many :ingredients, through: :doses # creates a method cocktail.ingredients
  has_many :tags, dependent: :destroy # creates a method cocktail.tags

  #validations
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
