class ApplicationController < ActionController::Base

  def redirect_if_not_gm(path, alert)
    if helpers.current_user != @campaign.gm
      redirect_to path, alert: alert
    end
  end
  
end
