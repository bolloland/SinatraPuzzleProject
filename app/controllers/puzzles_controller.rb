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
        current_player
        # binding.pry
        erb :"/puzzles/show"
    end

    post "/puzzles" do
        puzzle = Puzzle.new(params)
        if puzzle.title.blank? || puzzle.description.blank? || puzzle.category.blank? || puzzle.solution.blank? 
            flash[:error] = "You left something blank!"
            redirect '/puzzles/new'
        elsif
            Puzzle.exists?(title:params[:title])
            # puzzle.title.exists?
            flash[:error] = "Sorry, that title already exists :("
            redirect '/puzzles/new'
            binding.pry
        else
            current_player
            @current_player.games
            # new_puz = Puzzle.new(params)
            # Game.create(player_id: session[:player_id], puzzle_id: new_puz.id)
            # new_puz.save
            Game.create(player_id: session[:player_id], puzzle_id: puzzle.id)
            puzzle.save
            redirect "/puzzles/#{session[:player_id]}"
        end          
    end

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