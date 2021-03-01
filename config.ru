require './config/environment'
    # makes the app recognize the Controllers

# use SolverController
use Rack::MethodOverride
use PlayersController
use TeamsController
use PuzzlesController
run ApplicationController
