post '/round/:round_id/cards/:id/guesses' do
	@round = Round.find_by(id: params[:round_id])
	@deck = @round.deck
	@card = Card.find_by(id: params[:id])
	@guess = Guess.create(round: @round)
	@round.guesses << @guess
	@card.guesses << @guess
	if @card.user_correct?(params[:card][:answer])
		@card.update_attribute(:correct, true)
		if @deck.all_cards_correct?
			@round.update_attribute(:completed, true)
			redirect "/rounds/#{@round.id}/done"
		else
			flash[:message] = "Correct! Next question below"
			redirect "/rounds/#{@round.id}/next"
		end
	else
		flash[:wrong] = "Wrong answer. The correct answer was #{@card.answer}"
		redirect "/rounds/#{@round.id}/next"
	end
end
