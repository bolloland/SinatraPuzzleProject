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
    erb :welcome
  end

  get '/register' do
    "Register Page!"
  end

end
