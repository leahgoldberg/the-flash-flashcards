class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck

  def stats
  end
end
