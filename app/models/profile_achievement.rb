class ProfileAchievement < ApplicationRecord
  belongs_to :profile
  belongs_to :achievement

  validates :awarded_at, presence: true
end
