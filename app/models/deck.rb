class Deck < ActiveRecord::Base
  has_many :games
  has_many :cards

  validates_presence_of :name

  def random_card
    # non-destructive b/c shuffle returns a new array
    self.cards.shuffle.pop
  end

  def reset_cards!
    self.cards.each do |card|
      card.used = false
      card.save
    end
  end
end
