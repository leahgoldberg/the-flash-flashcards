class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  has_many :guesses

  # def self.first_guess_correct
  #   self.guesses.count > self.deck.cards.count ?
  # end

  def total_guesses
    self.guesses.count
  end
end
