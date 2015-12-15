class Tournament < ActiveRecord::Base
  has_many :rounds
  has_many :teams
  validates :Name, presence: true, uniqueness: true
end
