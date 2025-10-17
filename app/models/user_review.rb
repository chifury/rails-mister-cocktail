class UserReview < ApplicationRecord
  belongs_to :cocktail # creates a method user_review.cocktails
  belongs_to :user

  validates :title, presence: true
  validates :rating, presence: true
  validates :review, uniqueness: { scope: :cocktail_id } # This ensures Rails will validate that each review name is unique per cocktail before saving.
  validates :img_1, uniqueness: { scope: :cocktail_id }
  validates :img_2, uniqueness: { scope: :cocktail_id }
  validates :img_3, uniqueness: { scope: :cocktail_id }
end
