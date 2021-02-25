class Solver < ActiveRecord::Base
    has_many :players
    has_many :puzzles

end