post '/guess' do
  card = Card.find_by(id: params[:id])
  round = Round.find_by(id: params[:round_id])
  guess = Guess.new(card: card, round: round)
  if card.answer == params[:answer]
    guess.correct = "true"
    guess.save!
    redirect "/round/#{round.id}/card/#{round.new_card.id}"
  else
    guess.correct = "false"
    guess.save!
    redirect "/round/#{round.id}/card/#{round.new_card.id}"
  end
end
