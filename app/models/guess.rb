class Guess < ActiveRecord::Base
  belongs_to :round

  # validates_presence_of :input
end
