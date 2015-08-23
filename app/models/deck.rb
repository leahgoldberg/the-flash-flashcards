class Deck < ActiveRecord::Base
  has_many :rounds
  has_many :cards

  validates_presence_of :name

  def random_card
    self.cards.select {|card| card.correct}.sample
  end

  def reset_cards!
    self.cards.each {|card| card.correct=false}
  end

  def all_cards_correct?
    self.cards.all? {|card| card.correct}
  end
end
