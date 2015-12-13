class RoundsController < ApplicationController
  before_action :set_round, only: [:show, :edit, :update, :destroy]

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
        #temp = nil
        while(true)
          puts match_num.to_s
          team = @round.tournament.teams[match_num]
          next_team = @round.tournament.teams[match_num + 1]
          
          if(team.nil?)
            break
          elsif(next_team.nil?)
            puts team.Name
            match = Match.new(:Name => name.to_s, :round_id => @round.id, :home_team_id => team.id, :winner_id => team.id)
            match.save
            team.update(:match_id => match.id)
          else
            puts team.Name
            puts next_team.Name
            match = Match.new(:Name => name.to_s, :round_id => @round.id, :home_team_id => team.id, :away_team_id => next_team.id)
            match.save
            team.update(:match_id => match.id)
            next_team.update(:match_id => match.id)
          end
          name += 1
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
