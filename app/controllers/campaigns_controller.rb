class CampaignsController < ApplicationController
  before_action :find_campaign, only: [:show, :edit, :update, :destroy]

  def index
    if params[:user_id]
      @campaigns = User.find_by(id: params[:user_id]).campaigns
    else
      @campaigns = Campaign.all.where(is_public: true)
    end
  end

  def new
    @campaign = Campaign.new(gm_id: params[:user_id])
  end

  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.save
    redirect_to campaign_path(@campaign)
  end

  def show
  end

  def edit
  end

  def update
    @campaign.update(campaign_params)
    redirect_to campaign_path(@campaign)
  end

  def destroy
  end

  private

  def find_campaign
    @campaign = Campaign.find_by(id: params[:id])
  end

  def campaign_params
    params.require(:campaign).permit(:name, :description, :game_system, :is_public, :gm_id)
  end

end
