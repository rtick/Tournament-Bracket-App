class AddTournamentIdToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :tournament_id, :integer
  end
end
