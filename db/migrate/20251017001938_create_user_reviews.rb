class CreateUserReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :user_reviews do |t|
      t.float :rating
      t.string :review
      t.string :img_1
      t.string :img_2
      t.string :img_3
      t.references :cocktail, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
