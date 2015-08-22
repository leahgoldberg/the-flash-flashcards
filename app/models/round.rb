class Round < ActiveRecord::Base
  belongs_to :player, class_name: "User"
  belongs_to :deck
  has_many :guesses
  has_many :cards, through: :deck

  def new_card
    available_cards.sample
  end

  def available_cards
    cards.select do |card|
      card.no_or_incorrect_guess
    end
  end
end
