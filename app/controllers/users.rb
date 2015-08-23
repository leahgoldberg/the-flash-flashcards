get "/users/signin" do
  erb :"users/signin"
end

get "/users/signout" do
  session[:user_id] = nil
  redirect "/"
end

get "/users/new" do
  erb :"/users/new"
end

get "/users/:id" do
  require_signin
  @user = User.find_by(id: params[:id])
  @rounds = Round.where(player_id: params[:id]).reverse
  erb :'users/show'
end

put "/users/signin" do
  user = User.authenticate(params[:username], params[:password])
  if user
    session[:user_id] = user.id
    redirect "/"
  else
    flash[:sign_in_error] = "Either your username or email was incorrect."
    redirect "/users/signin"
  end
end

post "/user" do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/"
  else
    flash[:sign_up_error] = @user.errors.full_messages
    redirect "/users/new"
  end
end
