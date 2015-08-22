get '/decks' do
  @decks = Deck.all
  erb :'/welcome/index'
end

get '/decks/:id' do
  @deck = Deck.find_by(id: params[:id])
  erb :'/decks/show'
end
