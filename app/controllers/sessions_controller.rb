class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        return head(:forbidden) unless @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def create_by_omniauth
        user = User.find_or_create_by_oauth(auth)
        if user.valid?
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:message] = user.errors.full_messages.join(", ")
            redirect_to new_user_path
        end
    end

    def destroy
        session.delete :user_id
        redirect_to :root
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end
