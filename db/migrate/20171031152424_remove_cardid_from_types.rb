class RemoveCardidFromTypes < ActiveRecord::Migration[5.1]
  def change
    remove_column :types, :card_id
  end
end
