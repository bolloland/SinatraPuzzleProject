class Player < ActiveRecord::Base
    belongs_to :teams
    has_many :puzzles

    has_secure_password

end
