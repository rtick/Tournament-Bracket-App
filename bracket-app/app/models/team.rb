class Team < ActiveRecord::Base
  belongs_to :match
  belongs_to :tournament
  validates :Name, presence: true
  validates :tournament_id, presence: true
end
