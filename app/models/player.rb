class Player < ActiveRecord::Base
    has_many :puzzles, through: :games
    has_many :games

    has_secure_password

end
