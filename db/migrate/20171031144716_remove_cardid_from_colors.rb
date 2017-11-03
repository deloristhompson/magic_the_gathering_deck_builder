class RemoveCardidFromColors < ActiveRecord::Migration[5.1]
  def change
    remove_column :colors, :card_id
  end
end
