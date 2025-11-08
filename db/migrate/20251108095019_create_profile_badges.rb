class CreateProfileBadges < ActiveRecord::Migration[7.1]
  def change
    create_table :profile_badges do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :badge, null: false, foreign_key: true
      t.datetime :awarded_at

      t.timestamps
    end
  end
end
