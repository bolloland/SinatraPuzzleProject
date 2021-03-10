class PlayersController < ApplicationController
    #for anything pertaining to players

    get '/players' do
        if current_player == nil
            flash_home
        else
        @players = Player.all
        erb :"/players/index"
        end
    end

    get "/signup" do
        #takes user from root page to signup page
        erb :"/players/signup"
    end
     
    post '/signup' do
        player = Player.new(params)
        
        #validate new player:
        if player.username.blank? || player.email.blank? || player.password.blank? 
            flash[:error] = "You left something blank!"
            redirect '/signup'
        elsif Player.find_by_email(params[:email]) || Player.find_by_username(params[:username])
            flash[:error] = "That email or username has been used."
            redirect '/signup'
        else 
            player.save
            session[:player_id] = player.id # logging user in
            redirect "/players/gameroom/#{session[:player_id]}"
        end 
    end 
    
    get "/players/gameroom/:id" do  #SHOW Player Stats
            @player = Player.find_by_id(params[:id])
            erb :"/players/gameroom"
    end

    post "/login" do
        # binding.pry
        player = Player.find_by_username(params[:username])

        if player && player.authenticate(params[:password])
            # login user
            session[:player_id] = player.id
            # redirect 
            redirect "/players/gameroom/#{session[:player_id]}"
        else 
            # flash[]
            flash[:error] = "Sorry! Invalid username or password. Try again. "
            # invalid login
            redirect '/'
        end 
    end 

    get '/logout' do
        session.clear
        redirect '/'
    end 

    get '/players/account' do
        @player = current_player
        if @player == nil 
            flash_home
        else
        erb :"/players/gameroom"
        end
    end

end
     


 
