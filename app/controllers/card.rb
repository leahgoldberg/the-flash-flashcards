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
