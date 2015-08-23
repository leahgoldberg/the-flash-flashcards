get '/games/:id/done' do
  @game = Game.find_by(id:params[:id])
  if @game
    erb :"games/done"
  else
    status 404
    erb :"errors/not_found"
  end
end

get '/games/:id/rounds/new' do
  @game = Game.find_by(id: params[:id])
  @deck = @game.deck
  @round = Round.new(game: @game) # not sure if needs game
  loop do
    @card = @deck.random_card
    redirect "games/#{@game.id}/done" if end_of_deck?(@deck)
    break if @card.used != true
  end
  @card.used = true
  @round.cards << @card
  @game.rounds << @round
  # something in the *model* needs to know if a card has been 'used' in a round
  if @game && @deck && @round.save
    redirect "games/#{@game.id}/guesses/new"
  else
    status 404
    erb :"errors/not_found"
  end
end

get '/games/:id/guesses/new' do
  @game = Game.find_by(id: params[:id])
  @deck = @game.deck
  @round = @game.rounds.last
  @card = @round.cards.last
  if @game && @deck && @round && @card
    erb :"cards/show"
  else
    status 404
    erb :"errors/not_found"
  end
end

post '/games/:id/guesses/new' do
  @game = Game.find_by(id: params[:id])
  @deck = @game.deck
  @round = @game.rounds.last
  @card = @round.cards.last
  puts @card.answer
  if correct?(@card,params)
    redirect "/games/#{@game.id}/rounds/new"
  else
    redirect "/games/#{@game.id}/guesses/new"
  end
end

def correct?(card, params)
  card.answer.downcase == params[:card][:answer].downcase
end

def end_of_deck?(deck)
  deck.cards.pluck(:used).all? { |used| used == true }
end


