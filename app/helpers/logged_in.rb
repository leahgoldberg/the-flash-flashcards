helpers do
  def logged_in?
    return true if session[:user_id]
  end

  def require_login
    redirect "/" unless logged_in?
  end
end
