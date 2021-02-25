class CreateSolutions < ActiveRecord::Migration[5.2]
  def change
    create_join_table :players, :puzzles, table_name: :solutions do |t|
      t.string :player_id
      t.string :puzzle_id
    end
  end
end
