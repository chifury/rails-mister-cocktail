class Dose < ApplicationRecord
  belongs_to :cocktail # creates a method dose.cocktails
  belongs_to :ingredient # creates a method dose.ingredients

  accepts_nested_attributes_for :ingredient

  validates :amount, presence: true
  validates :cocktail, presence: true
  validates :ingredient, presence: true
  validates :ingredient_id, uniqueness: { scope: :cocktail_id }
end
