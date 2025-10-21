class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :cocktail

  validates :user_id, uniqueness: { scope: :cocktail_id } # This ensures Rails will validate that each user's favorite is unique per cocktail before saving.
end
