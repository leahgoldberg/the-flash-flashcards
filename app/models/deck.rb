class Deck < ActiveRecord::Base
  has_many :games
  has_many :cards

  validates_presence_of :name
end
