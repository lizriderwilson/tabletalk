class ApplicationController < ActionController::Base

  def redirect_if_not_gm(path)
    if helpers.current_user != @campaign.gm
      redirect_to path
    end
  end
  
end
