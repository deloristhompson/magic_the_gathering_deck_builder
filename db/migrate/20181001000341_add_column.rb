class AddColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :search_id, :integer, null: false
  end
end
