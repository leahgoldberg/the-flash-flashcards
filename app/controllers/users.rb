get "/users/signin" do
  erb :"users/signin"
end




put "/users/signin" do
  user = User.authenticate(params[:username], params[:password])
  if user
    sessions[:user_id] = user.id
    redirect '/'
  else
    redirect '/'
  end
end
