class Guess < ActiveRecord::Base
  belongs_to :round
  belongs_to :card

  def incorrect?
    correct == "false"
  end
end
