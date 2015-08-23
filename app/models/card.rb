class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses
  belongs_to :round

  validates_presence_of :question, :answer
end
