class TeamValidator < ActiveModel::Validator
  def validate(record)
    if record.tournament && (record.tournament.teams.count > 16)
      record.errors[:base] << "Tournament full"
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
