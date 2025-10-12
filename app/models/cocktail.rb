class Cocktail < ApplicationRecord
  # associations
  # The dependent: :destroy on cocktails deletes associated doses when a cocktail is deleted, but not ingredients.
  belongs_to :user
  has_many :doses, dependent: :destroy # creates a method cocktail.doses
  has_many :ingredients, through: :doses # creates a method cocktail.ingredients
  has_many :tags, dependent: :destroy # creates a method cocktail.tags

  accepts_nested_attributes_for :doses, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :tags, allow_destroy: true, reject_if: :all_blank
  # accepts_nested_attributes_for :tags, allow_destroy: true, reject_if: proc { |attributes| attributes["name"].blank? }
  # The code in line 10 probably does the same as the code in line 9.

  #validations
  validates :user_id, presence: true
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validate :max_doses_limit
  validate :max_tags_limit

  def max_doses_limit
    if doses.size > 5
      errors.add(:doses, "maximum 5 ingredients are allowed")
    end
  end

  def max_tags_limit
    if tags.size > 10
      errors.add(:tags, "maximum 10 tags are allowed")
    end
  end
end
