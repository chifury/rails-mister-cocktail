class AddTitleToUserReview < ActiveRecord::Migration[7.1]
  def change
    add_column :user_reviews, :title, :string
  end
end
