class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.string :name
      t.string :artist
      t.string :power
      t.string :toughness
      t.string :text
      t.integer :cmc
      t.string :mana_cost

      t.timestamps
    end
  end
end
