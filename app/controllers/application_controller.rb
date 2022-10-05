class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def require_user
        if !logged_in?
            respond_to do |format|
                format.html {redirect_to root_path, notice: "You must be logged in to perform that action" }
                format.json { render :show, status: :created, location: user }
            end
        end
    end
end
