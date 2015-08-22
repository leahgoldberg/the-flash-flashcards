get '/games/:game_id/cards/:card_id/rounds/:id' do
  @game = Game.find_by(id: params[:game_id])
  @card = Card.find_by(id:params[:card_id])
  @round = @game.rounds.count
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

post '/games/:game_id/cards/:card_id/rounds/:id' do
  @game = Game.find_by(id: params[:game_id])
  @card = Card.find_by(id: params[:id])
  @round_num = @game.rounds.count
  @round = @game.rounds.last
  @guess = Guess.new(round:@round)
  @round.guesses << @guess
  @guess_num = @round.guesses.count
  if @game && @card && @round
    @next_card = Card.find_by(id: @card.id+1)
    if @card.answer.downcase == params[:card][:answer].downcase
      @game.rounds << Round.new(game:@game)
      redirect "/games/#{@game.id}/cards/#{@next_card.id}/rounds/#{@round_num+1}"
    else
      if @guess_num==3
        flash[:message] = "The right answer was #{@card.answer}"
        @game.rounds << Round.new(game:@game)
        redirect "/games/#{@game.id}/cards/#{@next_card.id}/rounds/#{@round_num+1}"
      else
      flash[:message] = "Wrong answer! You have #{3-@guess_num} guesses left.#{@game.id} #{@round.id} #{@guess_num}"
      redirect "/games/#{@game.id}/cards/#{@card.id}/rounds/#{@round_num}"
      end
    end
  else
    flash[:errors] = @game.errors.full_messages + @card.errors.full_messages
    redirect "/games/#{@game.id}/cards/#{@card.id}/rounds/#{@round_num}"
  end
end



