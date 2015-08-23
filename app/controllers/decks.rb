get '/decks' do
  require_signin
  @decks = Deck.all
  erb :'/welcome/index'
end

get '/decks/new' do
  erb :'/decks/new'
end

get '/decks/:id' do
  require_signin
  @deck = Deck.find_by(id: params[:id])
  @cards = @deck.cards
  erb :'/decks/show'
end

post '/decks' do
  p params[:decklength]
  p params[:deck][:name]
end

