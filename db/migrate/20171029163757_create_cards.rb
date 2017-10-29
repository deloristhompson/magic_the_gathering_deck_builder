class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :name, null: false
      t.string :artist, null: false
      t.string :text, null: false
      t.string :mana_cost, null: false
      t.string :power, null: false
      t.string :toughness, null: false
      t.integer :cmc, null: false

      t.timestamps
    end
  end
end
