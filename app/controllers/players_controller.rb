class PlayersController < ApplicationController
    #for anything pertaining to players

    

    post '/signup' do
        player = Player.new(params)
        
        #validate new player:
        if player.username.blank? || player.email.blank? || player.password.blank? 
            # || Player.find_by_email(params[:email]) || Player.find_by_username(params[:username])
            
            #flash[:error] = "Invlaid Login"
            redirect '/signup'
        else 
            
            player.save
            session[:player_id] = player.id  
            # logging user in
            redirect "/welcome/#{player.id}"
        end
    end

    get "/welcome/:id" do
            @player = Player.find_by_id(params[:id])
      # binding.pry
            erb :welcome
    end

    get 'players/signup' do
        erb :signup
    end
     


 
end
