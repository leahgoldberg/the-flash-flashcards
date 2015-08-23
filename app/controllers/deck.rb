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

put '/decks/:id' do
  p params.to_s
  @deck = Deck.find_by(id: params[:id])
  @deck.name = params[:deck][:name]
  @cards = @deck.cards
  @cards.each_with_index do |card, i|
    card.question = params[:card]["#{i}"][:question]
    card.answer = params[:card]["#{i}"][:answer]
    unless card.save
      flash[:errors] = card.errors.full_messages
      redirect "/users/decks/#{@deck.id}/edit"
    end
  end
  if @deck.save
    redirect "/users/#{current_user.id}/profile"
  else
    flash[:errors] = @deck.errors.full_messages
    redirect "/users/decks/#{@deck.id}/edit"
  end
end

delete '/decks/:id' do
  @deck = Deck.find_by(id: params[:id])
  @deck.destroy
  erb :'/users/profile'
end

get '/decks' do
  @decks = Deck.all
  erb :'decks/index'
end

get "/users/decks/:id/edit" do
  @deck = Deck.find_by(id: params[:id])
  @cards = @deck.cards
  if @deck.valid?
    erb :'/decks/edit'
  else
    flash[:errors] = @deck.errors.full_messages
  end
end

get '/users/decks' do
  @user = current_user
  if logged_in?
    @decks = Deck.find_author(@user.id)
    erb :'users/decks'
  else
    redirect '/users/login'
  end
end



