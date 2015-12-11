class Round < ActiveRecord::Base
  belongs_to :tournament
  has_many :matches
  validates :Name, presence: true
end
