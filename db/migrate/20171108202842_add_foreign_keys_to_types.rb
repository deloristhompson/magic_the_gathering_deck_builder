class AddForeignKeysToTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :type_id, :integer, null: false
    add_foreign_key :cards, :types
  end
end
