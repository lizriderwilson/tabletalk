class SeshionsController < ApplicationController
  before_action :find_seshion, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @seshion = Seshion.new(campaign_id: params[:campaign_id])
  end

  def create
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
