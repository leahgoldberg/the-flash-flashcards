get '/games/:id/done' do
  @game = Game.find_by(id:params[:id])
  if @game
    erb :"games/done"
  else
    status 404
    erb :"errors/not_found"
  end
end

get '/decks/:id/games/new' do
  @deck = Deck.find_by(id: params[:id])
  @game = Game.new(deck: @deck)
  if @deck && @game.save
    erb :'games/new'
  else
    status 404
    erb :"errors/not_found"
  end
end
