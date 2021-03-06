
# Start by wiping the db
Player.destroy_all
Puzzle.destroy_all
Game.destroy_all

# Create our seeded players
ryan = Player.create(username: "Ryan", email: "ryan@ryan.com", password: "123")
court = Player.create(username: "Court", email: "court@court.com", password: "123")
kellen = Player.create(username: "Kellen", email: "kellen@kellen.com", password: "123")
lauren = Player.create(username: "Lauren", email: "lauren@ryan.com", password: "123")
beck = Player.create(username: "Beckett", email: "beck@beck.com", password: "123")
gid = Player.create(username: "Gideon", email: "gid@gid.com", password: "123")
mike = Player.create(username: "Mike", email: "mike@mike.com", password: "123")
chris = Player.create(username: "Christy", email: "chris@chris.com", password: "123")
neko = Player.create(username: "Neko", email: "neko@neko.com", password: "123")
lizzie = Player.create(username: "Lizzie", email: "liz@liz.com", password: "123")

# Create our seeded puzzles
sudoku = Puzzle.create(title: "Sudoku", description: "1 through 9 in 9 boxes", category: "logic", solution: "link", created_by: "Ryan")
kenken = Puzzle.create(title: "KenKen", description: "math Sudoku", category: "math", solution: "42", created_by: "Ryan")
jumble = Puzzle.create(title: "Jumble", description: "unscramble words > solve meta", category: "word", solution: "Hot Fudge Sunday", created_by: "Court")
cross = Puzzle.create(title: "Crossword", description: "cross some words", category: "word", solution: "Apple Dumpling Gang", created_by: "Court")
nytimes = Puzzle.create(title: "NY Times Crossword", description: "cross some words, but harder", category: "word", solution: "Jeremy Perogative", created_by: "Beckett")
cryptic = Puzzle.create(title: "Cryptic", description: "double clue crossword", category: "word", solution: "Chucklehead", created_by: "Gideon")
flag = Puzzle.create(title: "Semaphore", description: "letters through semaphore", category: "flag", solution: "Chunky Monkey", created_by: "Ryan")
blind = Puzzle.create(title: "Braille", description: "solution codes out to braille letters", category: "logic", solution: "Wonderboy", created_by: "Court")
mit = Puzzle.create(title: "MIT Puzzle Hunt", description: "ARG", category: "logic", solution: "Thunder & Lightning", created_by: "Mike")

# Creating your games from the player instances
ryan.games.create(puzzle_id: sudoku.id, solved?: true)
ryan.games.create(puzzle_id: flag.id, solved?: true)
ryan.games.create(puzzle_id: blind.id, solved?: true)
ryan.games.create(puzzle_id: kenken.id)
court.games.create(puzzle_id: jumble.id, solved?: true)
court.games.create(puzzle_id: mit.id, solved?: true)
beck.games.create(puzzle_id: cross.id, solved?: true)
gid.games.create(puzzle_id: cross.id, solved?: true)
neko.games.create(puzzle_id: cross.id)
neko.games.create(puzzle_id: cryptic.id)
mike.games.create(puzzle_id: cross.id, solved?: true)
lizzie.games.create(puzzle_id: nytimes.id, solved?: true)
chris.games.create(puzzle_id: flag.id, solved?: true)
chris.games.create(puzzle_id: jumble.id, solved?: true)
chris.games.create(puzzle_id: mit.id, solved?: true)

puts "SEEDED"