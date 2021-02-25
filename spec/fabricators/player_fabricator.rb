Fabricator(:player) do
    team(inverse_of: :team)
    username { Faker::Puzzle.player }
end