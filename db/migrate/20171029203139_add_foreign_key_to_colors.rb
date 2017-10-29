class AddForeignKeyToColors < ActiveRecord::Migration[5.1]
  def change
    add_column :colors, :card_id, :integer, null: false
    add_foreign_key :colors, :cards
  end
end
