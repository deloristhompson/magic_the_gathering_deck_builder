class AddForeignKeysToCards < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :color_id, :integer, null: false
    add_column :cards, :rarity_id, :integer, null: false
    add_foreign_key :cards, :colors
    add_foreign_key :cards, :rarities
  end
end
