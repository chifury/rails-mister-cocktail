class RenameDescriptionToAmountInDoses < ActiveRecord::Migration[7.1]
  def change
    rename_column :doses, :description, :amount
    change_column :doses, :amount, :float, using: 'amount::float'
  end
end
