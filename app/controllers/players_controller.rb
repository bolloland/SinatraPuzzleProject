class PlayersController < ApplicationController
    #for anything pertaining to players

    get '/register' do
        erb :'/register'
    end

end