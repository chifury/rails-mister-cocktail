class CreateBadges < ActiveRecord::Migration[7.1]
  def change
    create_table :badges do |t|
      t.string :name
      t.text :description
      t.integer :level_required
      t.string :icon_url

      t.timestamps
    end
  end
end
