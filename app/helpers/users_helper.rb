module UsersHelper

    def display_user_name
        if @user == current_user
            "Your"
        else
            @user.username.capitalize + "'s"
        end
    end

end
