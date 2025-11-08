class CreatePoints < ActiveRecord::Migration[7.1]
  def change
    create_table :points do |t|
      t.integer :xp
      t.integer :level
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
