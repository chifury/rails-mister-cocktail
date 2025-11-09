class ProfileBadge < ApplicationRecord
  belongs_to :profile
  belongs_to :badge

  validates :awarded_at, presence: true
end
