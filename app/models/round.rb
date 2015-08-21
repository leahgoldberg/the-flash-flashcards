class Round < ActiveRecord::Base
  belongs_to :player, class_name: "User"
  belongs_to :deck
end
