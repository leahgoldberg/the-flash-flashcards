class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses

  def last_guess_incorrect?(current_round)
    current_round_guesses(current_round).last.incorrect?
  end

  def has_no_guesses?(current_round)
    current_round_guesses(current_round).empty?
  end

  def current_round_guesses(current_round)
    guesses.select do |guess|
      guess.round == current_round
    end
  end
end
