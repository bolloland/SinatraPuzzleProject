class TeamsController < ApplicationController
    #for anything pertaining to Teams

    post '/team_create' do
        team = Team.new(params)
        
        #validate new player:
        if team.teamname.blank? || Team.find_by_teamname(params[:teamname])
            
            #flash[:error] = "Invlaid Login"
            redirect '/team_create'
        else 
            team.save
            session[:team_id] = team.id   
            redirect "/teams/#{team.id}"
        end
    end

    get "/teams/:id" do
            @team = Team.find_by_id(params[:id])
            @player = Player.find_by_id(session[:player_id])
      # binding.pry
            erb :"/teams/team"
    end

end