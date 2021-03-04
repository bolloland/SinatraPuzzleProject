class PuzzlesController < ApplicationController

    get "/puzzles" do
        @puzzles = Puzzle.all 
        erb :"/puzzles/index"
    end
    
    
    get '/puzzles/new' do
        current_player
        erb :"/puzzles/new"
    end

    get "/puzzles/:id" do
        get_puzzle
        erb :"/puzzles/show"
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
        redirect_if_not_authorized
        @puzzle.update(title: params[:title], description: params[:description], category: params[:category], solution: params[:solution])
        redirect "/puzzles/#{puzzle.id}"   
        #  binding.pry
        erb :"/puzzles/edit"
    end

    delete '/puzzles/:id' do 
        get_puzzle
        @puzzle.destroy
        redirect '/puzzles'
        # no view 
    end 

    private 

    def get_puzzle 
        @puzzle = Puzzle.find_by(id:params[:id])
    end 

    def redirect_if_not_authorized
        if @puzzle.author != current_user
            flash[:error] = "You cant make this edit, you don't own this"
            redirect '/puzzles'
        end 

    end
end