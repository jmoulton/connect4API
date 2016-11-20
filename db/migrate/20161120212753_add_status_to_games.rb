class AddStatusToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :status, :string, default: "Active"
  end
end
