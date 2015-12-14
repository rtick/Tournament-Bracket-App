class RoundsController < ApplicationController
  before_action :set_round, only: [:show, :edit, :update, :destroy]
  
  @round_num = 0
  
  def get_winners
    round_done = true
    winners = []
    @round.matches.each do |match|
      winners.push(match.winner_id)
      if(match.winner.nil?)
        round_done = false
      end
      if(round_done == true)
        if winners.count == 1
          @round.tournament.update(:winner_id => winners[0].id)
        else
          @round_num += 1
          new_round = Round.new(:Name => (@round.Name + "_" + @round_num.to_s), :tournament_id => @round.tournament_id)
          new_round.save
        
          match_num = 0
          name = 1
          match_name = new_round.Name + "_" + name.to_s
          #temp = nil
          while(true)
            puts match_num.to_s
            team = winners[match_num]
            next_team = winners[match_num + 1]
          
            if(team.nil?)
              break
            elsif(next_team.nil?)
              puts team.Name
              match = Match.new(:Name => match_name, :round_id => new_round.id, :home_team_id => team.id, :winner_id => team.id)
              match.save
              team.update(:match_id => match.id)
            else
              puts team.Name
              puts next_team.Name
              match = Match.new(:Name => match_name, :round_id => new_round.id, :home_team_id => team.id, :away_team_id => next_team.id)
              match.save
              team.update(:match_id => match.id)
              next_team.update(:match_id => match.id)
            end
            name += 1
            match_name = new_round.Name + "_" + name.to_s
            match_num += 2
          end
        end
      end
    end
  end

  # GET /rounds
  # GET /rounds.json
  def index
    @rounds = Round.all
  end

  # GET /rounds/1
  # GET /rounds/1.json
  def show
  end

  # GET /rounds/new
  def new
    @round = Round.new
  end

  # GET /rounds/1/edit
  def edit
  end

  # POST /rounds
  # POST /rounds.json
  def create
    @round = Round.new(round_params)

    respond_to do |format|
      if @round.save
        match_num = 0
        name = 1
        match_name = @round.Name + "_" + name.to_s
        #temp = nil
        while(true)
          puts match_num.to_s
          team = @round.tournament.teams[match_num]
          next_team = @round.tournament.teams[match_num + 1]
          
          if(team.nil?)
            break
          elsif(next_team.nil?)
            puts team.Name
            match = Match.new(:Name => match_name, :round_id => @round.id, :home_team_id => team.id, :winner_id => team.id)
            match.save
            team.update(:match_id => match.id)
          else
            puts team.Name
            puts next_team.Name
            match = Match.new(:Name => match_name, :round_id => @round.id, :home_team_id => team.id, :away_team_id => next_team.id)
            match.save
            team.update(:match_id => match.id)
            next_team.update(:match_id => match.id)
          end
          name += 1
          match_name = @round.Name + "_" + name.to_s
          match_num += 2
        end
        
        format.html { redirect_to @round, notice: 'Round was successfully created.' }
        format.json { render :show, status: :created, location: @round }
      else
        format.html { render :new }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rounds/1
  # PATCH/PUT /rounds/1.json
  def update
    respond_to do |format|
      if @round.update(round_params)
        format.html { redirect_to @round, notice: 'Round was successfully updated.' }
        format.json { render :show, status: :ok, location: @round }
      else
        format.html { render :edit }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rounds/1
  # DELETE /rounds/1.json
  def destroy
    @round.destroy
    respond_to do |format|
      format.html { redirect_to rounds_url, notice: 'Round was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_round
      @round = Round.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def round_params
      params.require(:round).permit(:Name, :tournament_id)
    end
end
