class Tag < ApplicationRecord
  belongs_to :cocktail # creates a method tag.cocktails

  validates :name, presence: true
  validates :name, uniqueness: { scope: :cocktail_id } # This ensures Rails will validate that each tag name is unique per cocktail before saving.
  validates :cocktail, presence: true

end
