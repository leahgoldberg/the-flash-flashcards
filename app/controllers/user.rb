post '/users' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect "/users/#{user.id}/profile"
  else
    flash[:errors] = user.errors.full_messages
    redirect '/users/new'
  end
end

get '/users/new' do
  erb :'users/new'
end

post '/users/login' do
  user = User.find_by(email: params[:user][:email])
  if user.password == params[:user][:password]
    session[:user_id] = user.id
    redirect '/'
  else
    flash[:errors] = user.errors.full_messages
    redirect '/users/login'
  end
end

get '/users/login' do
  erb :'users/login'
end

get '/users/:id/profile' do
  @user = current_user
  @decks = Deck.find_author(@user.id)
  if logged_in?
    erb :'users/profile'
  else
    redirect '/users/login'
  end
end

get '/users/logout' do
  session.clear
  redirect '/'
end
