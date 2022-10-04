class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        respond_to do |format|
            if user && user.authenticate(params[:session][:password])
                session[:user_id] = user.id
                format.html { redirect_to users_path(user), notice: "You have logged in" }
                format.json { render :show, status: :created, location: user }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: user.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        session[:user_id] = nil
        respond_to do |format|
            format.html { redirect_to root_path, notice: "You have logged out" }
            format.json { render :show, status: :created, location: user }
        end
    end
end
