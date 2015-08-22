get 'decks/:deck_id/cards/:id' do
  @card = Card.find_by(id:params[:id])
  if @card
    @deck = @card.deck
    @round = Round.new
    erb :'cards/show'
  else
    status 404
    "error"
  end
end
