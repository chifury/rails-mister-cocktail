class Dose < ApplicationRecord
  belongs_to :cocktail # creates a method dose.cocktails
  belongs_to :ingredient # creates a method dose.ingredients

  validates :description, presence: true
  validates :cocktail, presence: true
  validates :ingredient, presence: true
  validates :ingredient_id, uniqueness: { scope: :cocktail_id }
end
