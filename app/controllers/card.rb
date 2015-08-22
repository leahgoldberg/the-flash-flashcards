get '/games/:game_id/cards/:card_id/rounds/:id' do
  @game = Game.find_by(id: params[:game_id])
  @card = Card.find_by(id:params[:card_id])
  @round = @game.rounds.last
  if @game && @card && @round
    @deck = @card.deck
    erb :'cards/show'
    # if @game.rounds.last.guesses == 3
    #   @deck.cards << Card.new(question:@card.question, answer:@card.answer)
      # erb :'cards/show'
    #   @card.destroy
    # end
  else
    status 404
    erb :'errors/not_found'
  end
end

post '/games/:game_id/cards/:card_id/round/:id' do
  @game = Game.find_by(id: params[:game_id])
  @card = Card.find_by(id: params[:id])
  @round = @game.rounds.last
  @guess = Guess.new(round:@round)
  @round.guesses << @guess
  if @game && @card && @round
    @next_card = Card.find_by(id: @card.id+1)
    if @card.answer.downcase == params[:card][:answer].downcase
      redirect "/games/#{@game.id}/cards/#{@card.id}" if @guess==3
      redirect "/games/#{@game.id}/cards/#{@next_card.id}/rounds/1"
    else
      flash[:message] = "Wrong answer! You have #{2-@guess} guesses left."
      redirect "/games/#{@game.id}/cards/#{@card.id}/rounds/#{@round.id}"
    end
  else
    flash[:errors] = @game.errors.full_messages + @card.errors.full_messages
    redirect "/games/#{@game.id}/cards/#{@card.id}"
  end
end

# post '/games/:game_id/cards/:id' do
#   @game = Game.find_by(id: params[:game_id])
#   @card = Card.find_by(id: params[:id])
#   @round = Round.new(game: @game)
#   @game.rounds << @round
#   @round.guesses << Guess.new(round: @round)
#   @next_card = Card.find_by(id: @card.id+1)
#   if @game && @card
#     @deck = @game.deck
#     @guess = @round.guesses.count
#     if @card.answer.downcase == params[:card][:answer].downcase
#       if guess == 3
#         redirect "/games/#{@game.id}/cards/#{@card.id}"
#       else
#         redirect "/games/#{@game.id}/done" if @next_card==nil
#         redirect "/games/#{@game.id}/cards/#{@next_card.id}"
#       end
#     else
#       flash[:message] = "Wrong answer! You have #{2-@guess} guesses left."
#       redirect "/games/#{@game.id}/cards/#{@card.id}"
#     end
#   else
#     flash[:errors] = @game.errors.full_messages + @card.errors.full_messages
#     redirect "/games/#{@game.id}/cards/#{@card.id}"
#   end
# end



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



