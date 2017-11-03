class AddColorToSearches < ActiveRecord::Migration[5.1]
  def change
    add_column :searches, :color, :string
  end
end
