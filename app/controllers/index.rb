get '/' do
  if signed_in?
    @decks = Deck.all
    erb :'/welcome/index'
  else
    erb :'/index'
  end
end
