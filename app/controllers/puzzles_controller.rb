class PuzzlesController < ApplicationController

    get "/puzzles" do
        @puzzles = Puzzles.all 
        erb :"puzzles/index"
    end
    
    
    get '/puzzles/new' do
        current_player
        erb :"/puzzles/new"
    end

    get "/puzzles/:id" do
        get_puzzle
        erb :"puzzles/show"
    end

    post "/puzzles" do
        current_player
        @current_player.games
        new_puz = Puzzle.create(params)
        Game.create(player_id: session[:player_id], puzzle_id: new_puz.id)
        

        redirect "/puzzles/#{session[:player_id]}"
    end

    # redirect "/puzzles/edit/#{session[:player_id]}"

    # if puzzle.title == "" || puzzle.description == "" || puzzle.category == "" || puzzle.solution == "" 
    #     # flash[:alert] = "You left something blank!"
    #     redirect '/puzzles/new'
    # else 
    #     current_player
    #     @current_player.games
    #     new_puz = Puzzle.create(params)
    #     Game.create(player_id: session[:player_id], puzzle_id: new_puz.id)
    # #   ##
    # #     puzzle.save
    # #     session[:player_id] = player.id # logging user in
    #     redirect "/puzzles/edit/#{session[:player_id]}"
    # end   


    get "/puzzles/:id/edit" do
     get_puzzle
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