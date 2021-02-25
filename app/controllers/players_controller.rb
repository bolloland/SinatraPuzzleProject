class PlayersController < ApplicationController
    #for anything pertaining to players

    get '/register' do
        erb :'players/register'
    end

end
