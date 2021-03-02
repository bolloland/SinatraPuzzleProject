class CreatePuzzles < ActiveRecord::Migration[5.2]
  def change
    create_table :puzzles do |t|
      t.string :title
      t.string :description
      t.string :category
      t.string :solution
     
    end
  end
end
