post '/user' do
  user = User.new(params[:user])
  if user.save # why doesn't this work as ternary?
    session[:user_id] = user.id
    redirect '/user/profile'
  else
    redirect '/user/registration'
  end
end

get '/user/registration' do
  erb :'user/registration'
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

post '/user/logout' do
  session.clear
  redirect '/'
end
