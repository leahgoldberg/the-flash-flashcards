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
  @creator = @deck.creator
  erb :'/decks/show'
end

post '/decks' do
  @deck = Deck.new(name: params[:deck][:name], creator_id: session[:user_id])
  # if @deck.save!
  #   params.keys[1..-1].each do |card|
  #     @deck.cards.create(question: params[card.to_sym][:question], answer: params[card.to_sym][:answer])
  #   end
  #   redirect '/decks'
  # else
  #   redirect '/'
  # end
  if @deck.save!
    redirect "/decks/#{@deck.id}/cards/new"
  else
    redirect '/'
  end

end

