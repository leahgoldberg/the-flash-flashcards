get '/decks/:deck_id/cards/:id' do
  @card = Card.find_by(id:params[:id])
  if @card
    @deck = @card.deck
    @round = Round.new
    @guess = Guess.new
    @game = Game.new(deck: @deck)
    @game.rounds << @round
    erb :'cards/show'
  else
    status 404
    "error"
  end
end

post '/games/:game_id/cards/:id' do
  @game = Game.find_by(id: params[:game_id])
  @deck = @game.deck
  @card = Card.find_by(id: params[:id])
  @next_card = Card.find_by(id: @card.id+1)
  # @game.rounds << Round.new
  if @game && @card
    if @card.answer == params[:card][:answer]
      redirect "/games/#{@game.id}/cards/#{@next_card.id}"
    elsif @game.rounds.guesses.count < 3
      @game.rounds.guesses << Guess.new
    else
    end
  else
    "error"
  end
end

# get '/decks/:id/games/new' do
#   @deck = Deck.find_by(id:params[:id])
#   @game = Game.new(deck: @deck, round:Round.new)
#   if @game.save
#     erb :'games/new'
#   else
#     "error"
#   end
# end

# get '/games/:id' do
#   @game = Game.find_by(id:params[:id])
#   @deck = @game.deck
#   @rounds = @game.rounds
#   if @game
#     if
#   else
#     status 404
#     "error"
#   end
# end



