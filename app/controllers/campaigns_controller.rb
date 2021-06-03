class CampaignsController < ApplicationController
  before_action :find_campaign, only: [:show, :update, :destroy]

  def index
    if params[:user_id]
      @campaigns = User.find_by(id: params[:user_id]).campaigns
    else
      @campaigns = Campaign.public
    end
  end

  def new
    if helpers.current_user
      @campaign = Campaign.new(gm_id: session[:user_id])
    else
      redirect_to campaigns_path
    end
  end

  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.save
    redirect_to campaign_path(@campaign)
  end

  def show
    @notes = @campaign.notes.all
    if helpers.current_user
      @note = Note.new(commentable_id: @campaign.id, user_id: helpers.current_user.id)
    end
  end

  def edit
    if params[:user_id]
      gm = User.find_by(id: params[:user_id])
      if gm.nil?
        redirect_to campaigns_path, alert: "User not found"
      else
        @campaign = gm.campaigns_as_gm.find_by(id: params[:id])
        redirect_to user_campaigns_path(gm), alert: "Campaign not found" if @campaign.nil?
      end
    else
      find_campaign
      redirect_if_not_gm(campaign_path(@campaign))
    end
  end

  def update
    @campaign.update(campaign_params)
    redirect_to campaign_path(@campaign)
  end

  def destroy
    @campaign.destroy
    redirect_to user_path(helpers.current_user)
  end

  private

  def find_campaign
    @campaign = Campaign.find_by(id: params[:id])
  end

  def campaign_params
    params.require(:campaign).permit(:name, :description, :game_system, :is_public, :gm_id)
  end

end
