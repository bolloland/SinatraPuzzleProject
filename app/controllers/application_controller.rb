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

  helpers do 

    def current_player 
      @current_player ||= Player.find_by_id(session[:player_id])
    end

    def logged_in?
      !!session[:player_id]
    end

    def hacking
        if !logged_in?
          flash_home
        end
    end


    def flash_home 
      flash[:login] = "Sign Up or Login to Access Puzzles"
        redirect '/'
    end

    def puzz_play
      @player = current_player
      get_puzzle
      redirect_if_not_authorized
    end
    
  end

end
