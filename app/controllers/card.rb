get '/games/:game_id/cards/:id' do
  @game = Game.find_by(id: params[:game_id])
  @card = Card.find_by(id:params[:id])
  if @card
    @deck = @card.deck
    erb :'cards/show'
  else
    status 404
    "error"
  end
end

post '/games/:game_id/cards/:id' do
  @game = Game.find_by(id: params[:game_id])
  @card = Card.find_by(id: params[:id])
  @next_card = Card.find_by(id: @card.id+1)
  if @game && @card
    @deck = @game.deck
    if @card.answer.downcase == params[:card][:answer].downcase
      redirect "/games/#{@game.id}/cards/#{@next_card.id}" unless @next_card==nil
      #redirect to profile
      redirect "/"
    else
      redirect "/games/#{@game.id}/cards/#{@card.id}"
    end
  else
    "error"
  end
end



# post '/games/:game_id/cards/:id' do
#   @game = Game.find_by(id: params[:game_id])
#   @deck = @game.deck
#   @card = Card.find_by(id: params[:id])
#   @next_card = Card.find_by(id: @card.id+1)
#   # @game.rounds << Round.new
#   if @game && @card
#     if @card.answer == params[:card][:answer]
#       redirect "/games/#{@game.id}/cards/#{@next_card.id}"
#     elsif @game.rounds.guesses.count < 3
#       @game.rounds.guesses << Guess.new
#       redirect "/games/#{@game.id}/cards/#{@card.id}"
#     else
#     end
#   else
#     "error"
#   end
# end



