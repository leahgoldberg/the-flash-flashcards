class Card < ActiveRecord::Base
  #ZM: Have an attr_writer for the current_round 

  belongs_to :deck
  has_many :guesses

  validates :question, presence: true
  validates :answer, presence: true

  def last_guess_incorrect?(current_round)
    current_round_guesses(current_round).last.incorrect?
  end

  def has_no_guesses?(current_round)
    current_round_guesses(current_round).empty?
  end

  def current_round_guesses(current_round)
    #ZM: I would use AR for this
    # guesses.where(round_id: current_round.id ) 
    #ZM: Look into scopes!

    guesses.select do |guess|
      guess.round == current_round
    end
  end
end
