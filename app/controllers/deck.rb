get '/decks/new' do
  @deck = Deck.new
  erb :'/decks/new'
end

post '/decks' do
  @deck = Deck.new(params[:deck])
  if @deck.save
    redirect "/decks/#{@deck.id}/cards/new"
  else
    flash[:errors] = @deck.errors.full_messages
    redirect '/decks/new'
  end
end

get '/decks' do
  @decks = Deck.all
  erb :'decks/index'
end



