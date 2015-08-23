class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  has_many :guesses

  def first_guess_correct
    self.deck.cards. {|card| card.guesses.count==1}.count
  end

  def total_guesses
    self.guesses.count
  end

  def total_cards
    self.deck.cards.count
  end
end
