class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  has_many :rounds

  def stats
  end

  def play

  end
end
