class Achievement < ApplicationRecord
  has_many :profile_achievements, dependent: :destroy
  has_many :profiles, through: :profile_achievements

  validates :name, presence: true
end
