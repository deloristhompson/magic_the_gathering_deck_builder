class RemoveCardIdFromRarities < ActiveRecord::Migration[5.1]
  def change
    remove_column :rarities, :card_id, :integer
  end
end
