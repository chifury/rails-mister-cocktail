class Point < ApplicationRecord
  belongs_to :profile

  validates :xp, numericality: { greater_than_or_equal_to: 0 }
  validates :level, numericality: { greater_than_or_equal_to: 1 }
end
