post '/users' do
  user = User.new(params[:user])
  if user.save # why doesn't this work as ternary?
    session[:user_id] = user.id
    redirect "/users/#{user.id}/profile"
  else
    flash[:errors] = user.errors.full_messages
    redirect '/users/new'
  end
end

get '/users/new' do
  erb :'user/new'
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
  erb :'user/login'
end

get '/users/:id/profile' do
  user = current_user
  if logged_in?
    erb :'user/profile'
  else
    redirect '/users/login'
  end
end

get '/users/logout' do
  session.clear
  redirect '/'
end
