class AddRarityToSearches < ActiveRecord::Migration[5.1]
  def change
    add_column :searches, :rarity, :string
  end
end
