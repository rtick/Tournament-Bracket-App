class TeamValidator < ActiveModel::Validator
  def validate(record)
    if record.tournament && (record.tournament.teams.count > 15)
      record.errors[:base] << "Tournament Full: can only have 16 teams!"
    end
  end
end

class Team < ActiveRecord::Base
  has_many :matches
  belongs_to :tournament
  validates :Name, presence: true, uniqueness: true
  #validates :tournament_id, presence: true
  validates_with TeamValidator
end
