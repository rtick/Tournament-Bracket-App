class Team < ActiveRecord::Base
  has_many :matches
  belongs_to :tournament
  validates :Name, presence: true, uniqueness: true
  validates :tournament_id, presence: true
end
