class Puzzle < ActiveRecord::Base
    belongs_to :players
    belongs_to :teams
end