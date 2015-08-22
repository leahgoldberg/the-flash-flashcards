get '/decks' do
  @user = User.find_by[:session_id]
  @decks = Deck.all
  erb :'decks/index'
end


