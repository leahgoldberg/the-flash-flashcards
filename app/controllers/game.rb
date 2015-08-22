get '/decks/:id/games/new' do
  @deck = Deck.find_by(id: params[:id])
  @game = Game.new(deck: @deck)
  if @game.save
    erb :'games/new'
  else
    "error"
  end
end
