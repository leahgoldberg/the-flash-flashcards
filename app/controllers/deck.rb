get '/decks/new' do
  @deck = Deck.new
  erb :'/decks/new'
end

post '/decks' do
  @deck = Deck.new(params[:deck])
  @deck.author = current_user.id
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

get "/users/decks/:id/edit" do
  @deck = Deck.find_by(id: params[:id])
  if @deck.valid?
    erb :'/decks/edit'
  else
    flash[:errors] = @deck.errors.full_messages
  end
end

get '/users/decks' do
  @user = current_user
  if logged_in?
    @decks = Deck.authored_by(@user.id)
    erb :'users/decks'
  else
    redirect '/users/login'
  end
end



