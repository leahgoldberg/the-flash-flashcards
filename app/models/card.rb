class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses

  validates_presence_of :question, :answer

  def user_correct?(user_input)
  	self.answer.downcase == user_input.downcase
  end
end
