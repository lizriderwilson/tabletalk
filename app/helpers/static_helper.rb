module StaticHelper

    def login_signup_or_user_link
        if current_user
            [
                { 
                    label: current_user.username,
                    path: user_path(current_user)
                }
            ]
        else
                        [
                { 
                    label: "Login",
                    path: login_path
                },
                                { 
                    label: "Sign Up",
                    path: signup_path
                }
            ]
        end
    end

end
