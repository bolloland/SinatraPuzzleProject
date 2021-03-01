require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    #set sessions
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
    #register Sinatra::Flash
  end

  get "/" do
    #binding.pry
    # @player = Player.find_by_username(params[:username])
    erb :root
  end
  
  get "/signup" do
   #takes user from root page to signup page
   erb :"/players/signup"
  end

  post '/signup' do
        player = Player.new(params)
        #validate new player:
        binding.pry
        if player.username.blank? || player.email.blank? || player.password.blank? || Player.find_by_email(params[:email]) || Player.find_by_username(params[:username])
            redirect '/signup'
        else 
            player.save
            session[:player_id] = player.id # logging user in
            redirect "/players/#{session[:player_id]}"
        end 
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
  
  helpers do #LINK controllers and views

    def current_player #whoever is logged in
      #memoization >> if current isn't assigned yet, assign that variable to this player
      @current_player ||= Player.find_by_id(session[:player_id])
    end

    def logged_in?
      !!session[:player_id]
    end

  end

end
