class TeamValidator < ActiveModel::Validator
  def validate(record)
    if record.home_team_id == record.away_team_id
      record.errors[:base] << "Teams cannot play themselves"
    end
  end
end
class Match < ActiveRecord::Base
  belongs_to :round
  belongs_to :home_team, :class_name => "Team"
  belongs_to :away_team, :class_name => "Team"
  belongs_to :winner, :class_name => "Team"
  validates :Name, presence: true, uniqueness: true
  validates :round_id, presence: true
  validates :home_team_id, presence: true
  validates_with TeamValidator
end
