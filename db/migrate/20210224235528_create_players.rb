class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :team_id
      t.integer :total_solved
    end
  end
end
