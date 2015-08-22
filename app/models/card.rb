class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses

  def has_incorrect_guesses?
    guesses.select {|guess| guess.incorrect?}
  end

  def has_no_guesses?
    guesses.empty?
  end
end
