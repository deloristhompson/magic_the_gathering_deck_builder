class CreateCompleteCards < ActiveRecord::Migration[5.1]
  def change
    create_table :complete_cards do |t|
      t.integer :card_id, null: false
      t.integer :rarity_id, null: false
      t.integer :type_id, null: false
      t.integer :color_id, null: false
      t.timestamps
    end
    add_foreign_key :complete_cards, :cards
    add_foreign_key :complete_cards, :rarities
    add_foreign_key :complete_cards, :colors
    add_foreign_key :complete_cards, :types

  end
end
