class CampaignsController < ApplicationController
  before_action :find_campaign, only: [:show, :update, :destroy]

  def index
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      @campaigns = @user.campaigns
      render 'index_for_user'
    else
      @campaigns = Campaign.public_games
    end
  end

  def new
    if current_user
      if params[:user_id] && !User.find_by(id: params[:user_id])
        redirect_to campaigns_path, alert: "User not found"
      elsif params[:user_id] && User.find_by(id: params[:user_id]) != current_user
        redirect_to new_user_campaign_path(current_user)
      else
        @campaign = Campaign.new(gm_id: session[:user_id])
      end
    else
      redirect_to campaigns_path, alert: "You must be signed in to make a new campaign."
    end
  end

  def create
    @campaign = Campaign.new(campaign_params)
    if @campaign.save
      redirect_to campaign_path(@campaign)
    else
      render :new
    end
  end

  def show
    if current_user
      @note = Note.new(commentable_id: @campaign.id, user_id: current_user.id)
    end
  end

  def edit
    if params[:user_id]
      user = User.find_by(id: params[:user_id])
      if user.nil?
        redirect_to campaigns_path, alert: "User not found"
      else
        @campaign = user.campaigns_as_gm.find_by(id: params[:id])
        redirect_to user_campaigns_path(user), alert: "Campaign not found" if @campaign.nil?
        redirect_if_not_gm(campaign_path(@campaign), "You can't edit a campaign that you don't GM")
      end
    else
      find_campaign
      redirect_if_not_gm(campaign_path(@campaign), "You can't edit a campaign that you don't GM")
    end
  end

  def update
    if @campaign.update(campaign_params)
      redirect_to campaign_path(@campaign)
    else
      render :edit
    end
  end

  def destroy
    @campaign.destroy
    redirect_to user_path(current_user)
  end

  private

  def find_campaign
    @campaign = Campaign.find_by(id: params[:id])
  end

  def campaign_params
    params.require(:campaign).permit(:name, :description, :game_system, :is_public, :gm_id)
  end

end
