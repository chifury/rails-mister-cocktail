class Dose < ApplicationRecord
  belongs_to :cocktail # creates a method dose.cocktail ?
  belongs_to :ingredient # creates a method dose.ingredient ?

  validates :description, presence: true
  validates :cocktail, presence: true
  validates :ingredient, presence: true
  validates :ingredient_id, uniqueness: { scope: :cocktail_id }
end
