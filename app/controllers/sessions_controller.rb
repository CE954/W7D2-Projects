class SessionsController < ApplicationController
    #login
    def create
        username = params[:user][:username]
        password = params[:user][:password]

        @user = User.find_by_credentials(username, password)

        if @user 
            login(@user)
            redirect_to user_url
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
