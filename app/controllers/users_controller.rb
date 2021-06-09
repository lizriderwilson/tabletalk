class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update]

    def index
        @users = User.all
    end

    def gms
        @users = User.gms
    end

    def players
        @users = User.players
    end

    def new
        if current_user
            redirect_to user_path(current_user)
        else
            @user = User.new
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user), notice: "Signup successful!"
        else
            render :new
        end
    end

    def show
        @campaigns = @user.campaigns.last(6)
        @characters = @user.characters.last(6)
    end

    def edit
        if current_user.nil?
            redirect_to user_path(@user), notice: "You do not have permission to edit this user."
        elsif @user != current_user
            redirect_to edit_user_path(current_user)
        end
    end

    def update
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    private

    def find_user
        @user = User.find_by(id: params[:id])
    end

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :username, :bio, :favorite_systems)
    end

end
