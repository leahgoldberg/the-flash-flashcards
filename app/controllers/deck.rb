get '/decks' do
  @decks = Deck.all
  erb :'decks/index'
end

get '/decks/:id/rounds/new' do
  @deck = Deck.find_by(id: params[:id])
  @round = Round.new(deck: @deck, user: current_user)
  if @deck && @round.save
    @deck.reset_cards!
    redirect "rounds/#{@round.id}/cards/#{@card.id}"
  else
    status 404
    erb :"errors/not_found"
  end
end



