class Team < ActiveRecord::Base
  belongs_to :match
  belongs_to :tournament
end
