class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(email: params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            log_in(user)
        else
            flash[:alert] = "Couldn't log in with that email/password combination."
            render :new
        end
    end

    def create_by_omniauth
        user = User.find_or_create_by_oauth(auth)
        if user.valid?
            log_in(user)
        else
            flash[:message] = user.errors.full_messages.join(", ")
            render :new
        end
    end

    def destroy
        session.delete :user_id
        redirect_to :root, notice: "Successfully logged out."
    end

    private

    def auth
        request.env['omniauth.auth']
    end

    def log_in(user)
        session[:user_id] = user.id
        redirect_to user_path(user), notice: "Successfully logged in!"
    end

end
