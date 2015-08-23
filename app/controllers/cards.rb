get "/round/:round_id/card/:id" do
  require_signin
  @card = Card.find_by(id: params[:id])
  @round = Round.find_by(id: params[:round_id])
  erb :"cards/show"
end

get '/decks/:id/cards/new' do
  require_signin
  @deck = Deck.find_by(id: params[:id])
  erb :'/cards/new'
end

post '/decks/:id/cards' do
  if params[:action] == "Add Card"
    @deck = Deck.find_by(id: params[:id])
    @deck.cards.create(params[:card])
    redirect "/decks/#{params[:id]}/cards/new"
  else
    @deck = Deck.find_by(id: params[:id])
    @deck.cards.create(params[:card])
    redirect '/decks'
  end
end
