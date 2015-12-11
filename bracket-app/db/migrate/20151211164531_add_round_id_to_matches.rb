class AddRoundIdToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :round_id, :integer
  end
end
