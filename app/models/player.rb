class Player < ActiveRecord::Base
    has_many :games
    has_many :puzzles, through: :games

    has_secure_password

end
