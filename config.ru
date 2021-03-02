require './config/environment'
    # makes the app recognize the Controllers

# use SolverController
use Rack::MethodOverride
use PlayersController
# use GamesController
use PuzzlesController
run ApplicationController
