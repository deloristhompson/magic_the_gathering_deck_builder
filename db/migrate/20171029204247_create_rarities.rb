class CreateRarities < ActiveRecord::Migration[5.1]
  def change
    create_table :rarities do |t|
      t.integer :card_id, null: false
      t.string :name, null: false

      t.timestamps
    end

    add_foreign_key :rarities, :cards
  end
end
