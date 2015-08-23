class Card < ActiveRecord::Base
  belongs_to :deck

  validates_presence_of :question, :answer

  def correct?(user_input)
  	self.answer.downcase == user_input.downcase
  end	
end
