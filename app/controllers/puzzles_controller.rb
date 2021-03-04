class PuzzlesController < ApplicationController

    get '/puzzles/new' do
        current_player
        erb :"/puzzles/new"
    end

    post "/puzzles" do
        current_player
        @current_player.games
        new_puz = Puzzle.create(params)
        Game.create(player_id: session[:player_id], puzzle_id: new_puz.id)

        redirect "/puzzles/edit/#{session[:player_id]}"
    end

    get "/puzzles/edit/:id" do
        @player = Player.find_by_id(params[:id])
        current_player
        #  binding.pry
        erb :"/puzzles/edit"
end

    # get '/puzzles/upload/:id' do
    #     binding.pry
    #     @player = Player.find_by_id(params[:id])
    #     session[:player_id] = player.id
    #     erb :"/puzzles/upload/:id"
    # end
   

    
end