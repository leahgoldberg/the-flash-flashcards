helpers do
  def signed_in?
    return true if session[:user_id]
  end

  def require_signin
    redirect "/" unless signed_in?
  end

  def current_user
    if signed_in?
      User.find_by(id: session[:user_id])
    else
      nil
    end
  end
end
