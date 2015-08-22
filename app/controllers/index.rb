get '/' do
  if signed_in?
    redirect '/decks'
  else
    erb :'/index'
  end
end
