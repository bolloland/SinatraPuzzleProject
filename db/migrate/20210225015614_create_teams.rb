class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :teamname
      t.boolean :meta_solved?
    end
  end
end
