class CharactersController < ApplicationController
    before_action :find_character, only: [:show, :edit, :update, :destroy]
    before_action :find_campaign, only: [:new, :create, :show, :edit, :update]

    def index
        @characters = Character.all
    end

    def new
        @character = Character.new(campaign_id: params[:campaign_id])
        redirect_if_not_allowed_to_join
    end

    def create
        @character = Character.new(character_params)
        byebug
        if @character.save
            redirect_to campaign_character_path(@campaign, @character)
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        @character.update(character_params)
        redirect_to campaign_character_path(@campaign, @character)
    end

    def destroy
    end

    private

    def find_character
        @character = Character.find_by(id: params[:id])
    end

    def find_campaign
        @campaign = Campaign.find_by(id: params[:campaign_id])
    end

    def redirect_if_not_allowed_to_join
        if helpers.current_user == @campaign.gm || @campaign.players.include?(helpers.current_user) || !helpers.current_user
            redirect_to campaign_path(@campaign)
        end
    end

    def character_params
        params.require(:character).permit(:name, :bio, :campaign_id, :player_id)
    end
    
end
