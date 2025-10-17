class Ingredient < ApplicationRecord
  has_many :doses # creates a method ingredient.doses
  has_many :cocktails, through: :doses # creates a method ingredient.cocktails

  validates :name, presence: true, uniqueness: true

  before_destroy :check_if_used_by_cocktails

  private

  def check_if_used_by_cocktails
    if doses.exists?
      errors.add(:base, "Cannot delete ingredient because it is used by at least one cocktail")
      throw :abort
    end
  end
end
