get '/decks/:id/games/new' do
  @deck = Deck.find_by(id: params[:id])
  @game = Game.new(deck: @deck, user: current_user)
  if @deck && @game.save
    @deck.reset_cards!
    redirect "games/#{@game.id}/rounds/new"
  else
    status 404
    erb :"errors/not_found"
  end
end

get '/decks' do
  @decks = Deck.all
  erb :'decks/index'
end


