class SeshionsController < ApplicationController
  before_action :find_campaign
  before_action :find_seshion, only: [:show, :edit, :update, :destroy]

  def index
    @seshions = @campaign.seshions
  end

  def show
  end

  def new
    @seshion = Seshion.new(campaign_id: params[:campaign_id])
  end

  def create
    @seshion = Seshion.new(seshion_params)
    @seshion.save
    redirect_to campaign_path(@seshion.campaign)
  end

  def show
    @notes = @seshion.notes.all
    @note = Note.new(commentable_id: @seshion.id, user_id: helpers.current_user.id)
  end

  def edit
  end

  def update
    @seshion.update(seshion_params)
    redirect_to campaign_seshion_path(@campaign, @seshion)
  end

  def destroy
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
