post '/round/:round_id/cards/:id/guesses' do
	@round = Round.find_by(params[:round_id])
	@deck = @round.deck
	@card = Card.find_by(params[:id])
	@guess = Guess.create(round: @round)
	@round.guesses << @guess
	if @card.user_correct?(params[:card][:answer])
		@card.correct = true
		if @deck.all_cards_correct?
			redirect "/rounds/#{@round.id}/done"
		else	
			flash[:message] = "Correct! Next question below"
			redirect "/round/#{@round.id}/cards/next"
		end	
	else
		flash[:message] = "Wrong answer."
		redirect "/round/#{@round.id}/cards/next"	
	end	
end