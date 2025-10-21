class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cocktails, dependent: :destroy # cocktails owned by user
  has_many :favorites, dependent: :destroy # favorites join records
  has_many :favorited_cocktails, through: :favorites, source: :cocktail # creates method current_user.favorited_cocktails, which retrieves all cocktails the user has favorited.
  has_many :user_reviews, dependent: :destroy

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 30 }, format: { with: /\A[a-zA-Z0-9_]+\z/, message: "only allows letters, numbers, and underscores" }

  validates :first_name, presence: true, length: { maximum: 50 }, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
end
