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

  post '/signup' do
    binding.pry
    @player = Player.create(params)
    erb :welcome_back
  end

end
