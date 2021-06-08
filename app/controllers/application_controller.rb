class ApplicationController < ActionController::Base

  helper_method [:current_user, :redirect_if_not_gm]

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def redirect_if_not_gm(path, alert)
    if current_user != @campaign.gm
      redirect_to path, alert: alert
    end
  end
  
end
