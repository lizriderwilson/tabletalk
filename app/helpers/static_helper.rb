module StaticHelper

    def login_signup_or_user_link
        if current_user
            link_to current_user.username, user_path(current_user)
        else
            link_to("Login", login_path) + link_to("Sign Up", signup_path)
        end
    end

end
