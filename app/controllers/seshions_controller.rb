class SeshionsController < ApplicationController
  before_action :find_campaign
  before_action :find_seshion, only: [:show, :update, :destroy]

  def index
    @seshions = @campaign.seshions
  end

  def show
  end

  def new
    if !@campaign
      redirect_to campaigns_path, alert: "Campaign not found."
    else
      @seshion = Seshion.new(campaign_id: params[:campaign_id])
      redirect_if_not_gm(campaign_seshions_path(@campaign), "You can't create a new session if you're not the GM")
    end
  end

  def create
    @seshion = Seshion.new(seshion_params)
    @seshion.save
    redirect_to campaign_seshions_path(@campaign)
  end

  def show
    @notes = @seshion.notes.all
    if current_user
      @note = Note.new(commentable_id: @seshion.id, user_id: current_user.id)
    end
  end

  def edit
    if !@campaign
      redirect_to campaigns_path, alert: "Campaign not found."
    else
      @seshion = @campaign.seshions.find_by(id: params[:id])
      if !@seshion
        redirect_to campaign_seshions_path(@campaign), alert: "Session not found in this campaign."
      else
        redirect_if_not_gm(campaign_seshion_path(@campaign, @seshion), "You can't edit a session if you're not the GM")
      end
    end
  end

  def update
    @seshion.update(seshion_params)
    redirect_to campaign_seshion_path(@campaign, @seshion)
  end

  def destroy
    @seshion.destroy
    redirect_to campaign_path(@campaign)
  end

  private

  def find_campaign
    @campaign = Campaign.find_by(id: params[:campaign_id])
  end
  
  def find_seshion
    @seshion = Seshion.find_by(id: params[:id])
  end

  def seshion_params
    params.require(:seshion).permit(:start_time, :campaign_id)
  end

end
