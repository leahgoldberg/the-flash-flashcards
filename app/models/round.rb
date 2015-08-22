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
      card.has_no_guesses? && card.has_incorrect_guesses?
    end
  end
end
