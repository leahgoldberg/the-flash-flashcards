get '/decks/:id/rounds/new' do
  @deck = Deck.find_by(id: params[:id])
  @round = Round.new(deck: @deck, user: current_user)
  if @deck && @round.save
    @deck.reset_cards!
    redirect "rounds/#{@round.id}/cards/next"
  else
    status 404
    erb :"errors/not_found"
  end
end

get 'rounds/:id/done' do 
	@round = Round.find_by(id: params[:id])
	if @round
		erb :'rounds/done'
	else
		status 404
		erb :'errors/not_found'
	end	
end	