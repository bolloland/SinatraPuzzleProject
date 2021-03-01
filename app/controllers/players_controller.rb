class PlayersController < ApplicationController
    #for anything pertaining to players

    # post "/login" do
    #     # binding.pry
    #     @player = Player.find_by_username(params[:username])
    
    #       if @player == nil
    #         redirect "/"
    #         #FLASH ERROR IN HERE?
    #       elsif !!@player.authenticate(params[:password])
    #         session[:id] = @player.authenticate(params[:password]).id
    #         # session[:team_id] = team.id   
    #         redirect "/teams/#{session[:team_id]}"
    #       else
    #         redirect to '/'
    #       end
    #   end
     

    get "/players/:id" do
            @player = Player.find_by_id(params[:id])
      # binding.pry
            erb :players
    end

    # get 'players/signup' do
    #     erb :signup
    # end
     


 
end
