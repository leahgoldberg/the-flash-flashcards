helpers do
  def signed_in?
    return true if session[:user_id]
  end

  def require_signin
    redirect "/" unless signed_in?
  end
end
