class Round < ActiveRecord::Base
  has_many :guesses
  belongs_to :game
  has_many :cards
end
