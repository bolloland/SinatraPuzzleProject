class PuzzlesController < ApplicationController

    get "/puzzles" do  #INDEX - Puzzle
        @puzzles = Puzzle.all 
        erb :"/puzzles/index"
    end
    
    get '/puzzles/new' do  #NEW - Puzzle
        if current_player == nil
            flash_home
        else        
        current_player
        erb :"/puzzles/new"
        end

    end

    get "/puzzles/:id" do  #SHOW - Puzzle
        if current_player == nil
            flash_home
        else
        get_puzzle
        current_player
        erb :"/puzzles/show"
        end
    end

    post "/puzzles" do  #CREATE - Puzzle
        puzzle = Puzzle.new(params)
        # binding.pry
        if puzzle.title.blank? || puzzle.description.blank? || puzzle.category.blank? || puzzle.solution.blank? 
            flash[:error] = "You left something blank!"
            redirect '/puzzles/new'
        elsif
            Puzzle.exists?(title:params[:title])
            # puzzle.title.exists?
            flash[:error] = "Sorry, that title already exists :("
            redirect '/puzzles/new'
        else
            # binding.pry
            current_player
            # @current_player.games
            puzzle.created_by = @current_player.username
            puzzle.save
            Game.create(player_id: session[:player_id], puzzle_id: puzzle.id)
            # @puzzle = puzzle
            redirect "/puzzles/#{puzzle.id}"
        end          
    end

    get "/puzzles/:id/edit" do
        current_player
        get_puzzle
        redirect_if_not_authorized
        erb :"/puzzles/edit"
    end
    
    patch "/puzzles/:id" do
        get_puzzle
        @puzzle.update(title: params[:title], description: params[:description], category: params[:category], solution: params[:solution])
    #    binding.pry
       redirect "/puzzles/#{@puzzle.id}"   
    end

    delete '/puzzles/:id' do 
        current_player
        get_puzzle
        redirect_if_not_authorized
        @puzzle.destroy
        redirect '/puzzles'
        # no view 
    end 

    private 

    def get_puzzle 
        # binding.pry
        @puzzle = Puzzle.find_by(id:params[:id])
    end 

    def redirect_if_not_authorized
        if @puzzle.created_by != current_player.username
            flash[:error] = "You cant edit this Puzzle, because you didn't create it."
            redirect "/puzzles/#{@puzzle.id}"
        end 
    end

    def my_puzzle?
        current_player.username == @puzzle.created_by
    end

    # def get_game
        
    # end


end