class Round < ActiveRecord::Base
  belongs_to :player, class_name: "User"
  belongs_to :deck
  has_many :guesses
  has_many :cards, through: :deck

  def new_card
    available_cards.sample
  end

  def available_cards
    cards.select do |card|
      card.has_no_guesses?(self) || card.last_guess_incorrect?(self)
    end
  end

  def num_first_answer_correct
    sql = "select count(*) from (select count(*) as cnt from guesses where round_id = #{self.id} group by card_id having count(*) = 1) as counts;"
    ActiveRecord::Base.connection.execute(sql).getvalue(0,0)
  end

  def progress
    guesses.where(correct: "true").length.to_f / deck.cards.length.to_f
  end
end
