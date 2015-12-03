class Team < ActiveRecord::Base
  belongs_to :match
  has_many :tournaments, :through => :participants
end
