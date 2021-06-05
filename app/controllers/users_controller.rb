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
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user), notice: "Signup successful!"
        else
            render :new
        end
    end

    def show
        @campaigns = @user.campaigns
        @characters = @user.characters
    end

    def edit
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
