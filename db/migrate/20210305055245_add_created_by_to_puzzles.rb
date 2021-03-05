class AddCreatedByToPuzzles < ActiveRecord::Migration[5.2]
  def change
    add_column :puzzles, :created_by, :string
  end
end
