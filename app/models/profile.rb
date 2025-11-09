class Profile < ApplicationRecord
  belongs_to :user
  has_many :points, dependent: :destroy

  has_many :profile_badges, dependent: :destroy
  has_many :badges, through: :profile_badges

  has_many :profile_achievements, dependent: :destroy
  has_many :achievements, through: :profile_achievements
end
