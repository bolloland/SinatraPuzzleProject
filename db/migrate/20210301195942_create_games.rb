class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :player_id
      t.integer :puzzle_id
      t.boolean :solved?, default: false
    end
  end
end
