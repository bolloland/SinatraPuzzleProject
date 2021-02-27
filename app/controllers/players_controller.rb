class PlayersController < ApplicationController
    #for anything pertaining to players


    post '/signup' do
        @player = Player.create(params)
        binding.pry
        validate new player:
        if player.username.blank? || player.email.blank? || player.password.blank? || Player.find_by_email(params[:email]) || Player.find_by_username(params[:username])
            redirect '/players/signup'
        else 
            player.save
            session[:player_id] = player.id # logging user in
            redirect '/welcome'
        end
    end

     


 
end
