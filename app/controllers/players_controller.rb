class PlayersController < ApplicationController
    #for anything pertaining to players

    get "/signup" do
        #takes user from root page to signup page
        erb :"/players/signup"
       end
     
    post '/signup' do
        player = Player.new(params)
        #validate new player:

        if player.username.blank? || player.email.blank? || player.password.blank? || Player.find_by_email(params[:email]) || Player.find_by_username(params[:username])
            redirect '/signup'
        else 
            player.save
            session[:player_id] = player.id # logging user in
            redirect "/players/#{session[:player_id]}"
        end 
    end 
    
    get "/players/:id" do
            @player = Player.find_by_id(params[:id])
      # binding.pry
            erb :players
    end


    post "/login" do
        # binding.pry
        player = Player.find_by_username(params[:username])
    
        if player == nil
            redirect "/"
            # flash[:error] = "Invalid username or password"
        elsif !!player.authenticate(params[:password])
            session[:id] = player.authenticate(params[:password]).id
            # session[:team_id] = team.id   
            redirect "/teams/#{session[:team_id]}"
        else
            redirect to '/'
        end
    end
     


    # get 'players/signup' do
    #     erb :signup
    # end
     


 
end
