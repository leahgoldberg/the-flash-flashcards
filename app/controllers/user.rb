post '/user' do
  user = User.new(params[:user])
  if user.save # why doesn't this work as ternary?
    session[:user_id] = user.id
    redirect '/user/profile'
  else
    flash[:errors] = user.errors.full_messages
    redirect '/user/new'
  end
end

get '/user/new' do
  erb :'user/new'
end

post '/user/login' do
  user = User.find_by(email: params[:user][:email])
  if user.password == params[:user][:password]
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/user/login'
  end
end

get '/user/login' do
  erb :'user/login'
end

get '/user/profile' do
  if logged_in?
    erb :'user/profile'
  else
    redirect '/user/login'
  end
end

get '/user/logout' do
  session.clear
  redirect '/'
end
