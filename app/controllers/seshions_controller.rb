class SeshionsController < ApplicationController
  before_action :find_seshion, only: [:show, :edit, :update, :destroy]

  def index
    @seshions = Campaign.find_by(id: params[:campaign_id]).seshions
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
    @campaign = @seshion.campaign
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_seshion
    @seshion = Seshion.find_by(id: params[:id])
  end

  def seshion_params
    params.require(:seshion).permit(:start_time, :campaign_id)
  end

end
