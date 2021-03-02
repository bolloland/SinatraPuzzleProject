class PuzzlesController < ApplicationController

    get '/upload' do
        erb :"/puzzles/upload"
    end
   
end