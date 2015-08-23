class Deck < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :cards

  validates :name, presence: true
end
