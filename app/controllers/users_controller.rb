class UsersController < ApplicationController

    def index
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        redirect_to new_user_path unless @user.save
        session[:user_id] = @user.id
    end

    def show
    end

    def edit
    end

    def update
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :username, :bio, :favorite_systems)
    end

end
