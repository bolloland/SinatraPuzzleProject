class PuzzlesController < ApplicationController

    get "/puzzles" do  #INDEX - Puzzle
        @puzzles = Puzzle.all 
        erb :"/puzzles/index"
    end
    
    get '/puzzles/new' do  #NEW - Puzzle
        hacking       
        erb :"/puzzles/new"
    end

    get "/puzzles/:id" do  #SHOW - Puzzle
        hacking
        get_puzzle
        current_player
        erb :"/puzzles/show"
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
        puzz_play
        erb :"/puzzles/edit"
    end

    post "/puzzles/:id/play" do
        @player = current_player
        get_puzzle
        # binding.pry
        @game = @player.games.find_or_create_by(puzzle_id: get_puzzle.id) {|g| g.puzzle_id == get_puzzle.id} 
        if @game
            # Game.create(player_id: current_player.id, puzzle_id: get_puzzle.id) 
                erb :"/players/gameroom"
            else     
                flash[:exist] = "You've already added this puzzle to your Gameroom" 
                redirect "/players/account"
            end
    end

    post "/puzzles/:id/solve" do
        @player = current_player
        get_puzzle
        @solving = @player.games.find_by_puzzle_id(@puzzle.id)
        if params[:guess].downcase.gsub(" ", "") != @puzzle.solution.downcase.gsub(" ", "")
            flash[:nope] = "Sorry, that's incorrect. Try again!"
            redirect "/puzzles/#{@puzzle.id}"
        else
            # binding.pry
                @solving.update(solved?: true)
                @player = Player.find_by_id(params[:id])
               redirect "/players/account"
            
        end
    end
    
    patch "/puzzles/:id" do
        get_puzzle
        redirect_if_not_authorized
        @puzzle.update(title: params[:title], description: params[:description], category: params[:category], solution: params[:solution])
    
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

 #not a repeat?, then save
#     if Game.exists?{:player_id == @player.id} && Game.exists?{:puzzle_id == get_puzzle.id}
#         flash[:exist] = "You've already added this to your Gameroom"
#         redirect "/players/gameroom/#{session[:player_id]}"
#     else
#         Game.create(player_id: @player.id, puzzle_id: get_puzzle.id)
#     end
#     erb :"/players/gameroom"
# end