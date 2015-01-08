module UserHelper
  def current_user
    @current_user ||= User.new session[:current_user] if session[:current_user].present?
  end

  def signed_in?
    current_user.present?
  end
end
