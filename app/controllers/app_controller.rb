class AppController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :auth_callback

  def index
  end

  def auth_callback
    auth = request.env['omniauth.auth']
    session[:current_user] = {
      nickname: auth.info['nickname'],
      image: auth.info['image'],
      uid: auth.uid,
      profile_url: auth['extra']['raw_info']['profileurl']
    }
    redirect_to root_url
  end

  def log_out
    reset_session
    redirect_to root_url
  end
end
