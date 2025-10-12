class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cocktails

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 30 }, format: { with: /\A[a-zA-Z0-9_]+\z/, message: "only allows letters, numbers, and underscores" }

  validates :first_name, presence: true, length: { maximum: 50 }, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
end
