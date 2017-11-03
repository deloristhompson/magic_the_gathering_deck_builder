class AddTypesToSearches < ActiveRecord::Migration[5.1]
  def change
    add_column :searches, :type, :string
  end
end
