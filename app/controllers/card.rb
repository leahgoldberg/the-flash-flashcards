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

get '/decks/:id/cards/new' do
  if logged_in?
    @deck = Deck.find_by(id:params[:id])
    @card = Card.new
    erb :'/cards/new'
  else
    status 401
    erb :'errors/unauthorized'
  end
end

post '/decks/:id/cards' do
  @deck = Deck.find_by(id:params[:id])
  @card = Card.new(params[:card])
  @deck.cards << @card
  if @card.save
    redirect "/decks/#{@deck.id}/cards/new"
  else
    flash[:errors] = @deck.errors.full_messages
    redirect "/decks/#{@deck.id}/cards/new"
  end
end
