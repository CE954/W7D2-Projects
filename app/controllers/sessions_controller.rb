class SessionsController < ApplicationController
    #login
    def create
        email = params[:user][:email]
        password = params[:user][:password]

        @user = User.find_by_credentials(email, password)

        if @user 
            login(@user)
            redirect_to user_url(@user)
        else  
            render :new
        end
    end

    #logout
    def destroy 
        logout 
        redirect_to new_session_url
    end

    #login page
    def new 
        @user = User.new 
        render :new
    end

end
