class Deck < ActiveRecord::Base
  has_many :rounds
  has_many :cards

  validates_presence_of :name

  def random_card
    self.cards.select {|card| !card.correct}.sample
  end

  def reset_cards!
    self.cards.each {|card| card.update_attribute(:correct,false)}
  end

  def reset_guesses!
    self.cards.each do |card|
      card.guesses.each do |guess|
        guess.delete
      end
    end
  end

  def all_cards_correct?
    self.cards.all? {|card| card.correct}
  end

  def self.find_author(id)
    self.where("author = ?", id)
  end
end
