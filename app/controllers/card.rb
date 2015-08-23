get '/rounds/:id/cards/next' do 
	@round = Round.find_by(id: params[:id])
	if @round
		@deck = @round.deck
		@card = @deck.random_card
		redirect "/rounds/#{@round.id}/cards/#{@card.id}"
	else
		status 404
		erb :'errors/not_found'
	end	
end	

get '/rounds/:round_id/cards/:id' do 
	@round = Round.find_by(id: params[:round_id])
	@card = Card.find_by(id: params[:id])
	if @round && @card
	  @deck = @round.deck
	  erb :'cards/show'
	else
		status 404
		erb :'errors/not_found'
	end  
end	