require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    #set sessions
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
    register Sinatra::Flash
  end

  get "/" do
    erb :root
  end

  
  helpers do #LINK controllers and views

    def current_player #whoever is logged in
      #memoization >> if current isn't assigned yet, assign that variable to this player
      @current_player ||= Player.find_by_id(session[:player_id])
    end

    def logged_in?
      !!session[:player_id]
    end

    def flash_home
        flash[:login] = "Sign Up or Login to Access Puzzles"
        redirect '/'
    end
    


  end

end
