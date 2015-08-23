post '/guess' do
  card = Card.find_by(id: params[:id])
  round = Round.find_by(id: params[:round_id])
  guess = Guess.new(card: card, round: round)
  if card.answer.downcase == params[:answer].downcase
    guess.correct = "true"
    guess.save!
    flash[:correct] = "Correct!"
    if round.new_card.nil?
      redirect "/round/#{round.id}"
    end
    redirect "/round/#{round.id}/card/#{round.new_card.id}"
  else
    guess.correct = "false"
    guess.save!
    flash[:incorrect] = "ಠ_ಠ I'll just put that back in the deck for you"
    if round.new_card.nil?
      redirect "/round/#{round.id}"
    end
    redirect "/round/#{round.id}/card/#{round.new_card.id}"
  end
end
