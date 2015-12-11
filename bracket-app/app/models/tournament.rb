class Tournament < ActiveRecord::Base
  has_many :rounds
  has_one :winner, :class_name => "Team"
  has_many :teams
end
