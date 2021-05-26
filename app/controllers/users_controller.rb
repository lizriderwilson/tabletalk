class UsersController < ApplicationController

    def index
    end

    def new
    raise params.inspect
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        return redirect_to new_user_path unless @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def show
        @user = User.find_by(id: params[:id])
        @campaigns = @user.campaigns.all
    end

    def edit
        @user = User.find_by(id: params[:id])
    end

    def update
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :username, :bio, :favorite_systems)
    end

end
