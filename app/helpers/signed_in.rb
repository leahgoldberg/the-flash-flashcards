helpers do
  def signed_in?
    #!!session[:user_id]
    return true if session[:user_id]
  end

  def require_signin
    redirect "/" unless signed_in?
  end

  def current_user
    User.find_by(id: session[:user_id]) if signed_in?
  end
end
