class CreateSolvers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :players, :puzzles, table_name: :solvers do |t|
      t.string :player_id
      t.string :puzzle_id
    end
  end
end
