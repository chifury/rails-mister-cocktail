class CreateProfileAchievements < ActiveRecord::Migration[7.1]
  def change
    create_table :profile_achievements do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :achievement, null: false, foreign_key: true
      t.datetime :awarded_at

      t.timestamps
    end
  end
end
