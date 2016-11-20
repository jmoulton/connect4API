class CreateMoves < ActiveRecord::Migration[5.0]
  def change
    create_table :moves do |t|
      t.string  :coordinate
      t.string  :player
      t.integer :game_id

      t.timestamps
    end
  end
end
