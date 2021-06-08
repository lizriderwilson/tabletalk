class CharactersController < ApplicationController
    before_action :find_character, only: [:show, :update, :destroy]
    before_action :find_campaign, only: [:new, :create, :show, :edit, :update, :destroy]

    def index
        @user = User.find_by(id: params[:user_id])
        @characters = @user.characters
    end

    def new
        if !@campaign
            redirect_to campaigns_path, alert: "Campaign not found."
        else
            @character = Character.new(campaign_id: params[:campaign_id], player_id: current_user)
            redirect_if_not_allowed_to_join
        end
    end

    def create
        @character = Character.new(character_params)
        if @character.save
            redirect_to campaign_character_path(@campaign, @character)
        else
            render :new
        end
    end

    def show
    end

    def edit
        if !@campaign
            redirect_to campaigns_path, alert: "Campaign not found."
        else
            @character = @campaign.characters.find_by(id: params[:id])
            if !@character
                redirect_to campaign_path(@campaign), alert: "Character not found in this campaign."
            else
                redirect_if_not_allowed_to_edit
            end
        end
    end

    def update
        if @character.update(character_params)
            redirect_to campaign_character_path(@campaign, @character)
        else
            render :edit
        end
    end

    def destroy
        @character.destroy
        redirect_to campaign_path(@campaign)
    end

    private

    def find_character
        @character = Character.find_by(id: params[:id])
    end

    def find_campaign
        @campaign = Campaign.find_by(id: params[:campaign_id])
    end

    def redirect_if_not_allowed_to_join
        if current_user == @campaign.gm || @campaign.players.include?(current_user) || !current_user
            redirect_to campaign_path(@campaign), alert: "You cannot join this campaign! You are either the gm, already a player, or not logged in."
        end
    end

    def redirect_if_not_allowed_to_edit
        if current_user != @character.player
            redirect_to campaign_character_path(@campaign, @character)
        end
    end

    def character_params
        params.require(:character).permit(:name, :bio, :campaign_id, :player_id)
    end
    
end
