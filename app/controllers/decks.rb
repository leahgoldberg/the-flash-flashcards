get '/decks' do
  require_signin
  #ZM: Limit this to like 100 max
  @decks = Deck.all
  erb :'/welcome/index'
end

get '/decks/new' do
  require_signin
  erb :'/decks/new'
end

get '/decks/:id' do
  require_signin
  @deck = Deck.find_by(id: params[:id])
  @cards = @deck.cards
  @creator = @deck.creator
  erb :'/decks/show'
end

post '/decks' do
  @deck = Deck.new(name: params[:deck][:name], creator_id: session[:user_id])
  if @deck.save!
    redirect "/decks/#{@deck.id}/cards/new"
  else
    #ZM: What is the error?!? Why did my save not work???
    redirect '/'
  end
end

delete '/decks/:id' do
  @deck = Deck.find_by(id: params[:id])
  @deck.destroy
  redirect '/decks'
end
