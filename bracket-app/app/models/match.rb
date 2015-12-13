class Match < ActiveRecord::Base
  belongs_to :round
  has_one :home_team, :class_name => "Team"
  has_one :away_team, :class_name => "Team"
  has_one :winner, :class_name => "Team"
  validates :Name, presence: true, uniqueness: true
  validates :round_id, presence: true
  validates :home_team_id, presence: true
end
