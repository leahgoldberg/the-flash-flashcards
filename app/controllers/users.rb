get "/users/signin" do
  erb :"users/signin"
end


get "/users/new" do
  erb :"/users/new"
end

put "/users/signin" do
  user = User.authenticate(params[:username], params[:password])
  if user
    session[:user_id] = user.id
    redirect "/"
  else
    "Sad"
  end
end

post "/user" do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    # redirect "/decks"
  else
    # flash[:error] = @user.errors.full_messages
    # redirect "/users/new"
    "SAD"
  end
end
