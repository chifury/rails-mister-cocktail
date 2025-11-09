class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Profile association (one-to-one)
  has_one :profile, dependent: :destroy
  after_create :create_profile

  # User follows others - active relationships
  has_many :active_follows, class_name: "Follow",
                            foreign_key: "follower_id",
                            dependent: :destroy
  has_many :following, through: :active_follows, source: :followed

  # Users who follow this user - passive relationships
  has_many :passive_follows, class_name: "Follow",
                             foreign_key: "follow_id",
                             dependent: :destroy
  has_many :followers, through: :passive_follows, source: :follower

  has_many :cocktails, dependent: :destroy # cocktails owned by user
  has_many :favorites, dependent: :destroy # favorites join records
  has_many :favorited_cocktails, through: :favorites, source: :cocktail # creates method current_user.favorited_cocktails, which retrieves all cocktails the user has favorited.
  has_many :user_reviews, dependent: :destroy

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 30 }, format: { with: /\A[a-zA-Z0-9_]+\z/, message: "only allows letters, numbers, and underscores" }

  validates :first_name, presence: true, length: { maximum: 50 }, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }

  private

  # Create an empty profile when user is created
  def create_profile
    Profile.create(user: self)
  end

  # Follow another user (cannot follow self)
  def follow(other_user)
    active_follows.create(followed_id: other_user.id) unless self == other_user
  end

  # Unfollow a user
  def unfollow(other_user)
    active_follows.find_by(followed_id: other_user.id)&.destroy
  end

  # Check if following a given user
  def following?(other_user)
    following.include?(other_user)
  end
end
