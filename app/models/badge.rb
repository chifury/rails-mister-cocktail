class Badge < ApplicationRecord
  has_many :profile_badges, dependent: :destroy
  has_many :profiles, through: :profile_badges

  validates :name, presence: true
  validates :level_required, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
