class ApplicationController < ActionController::Base
    before_action :require_user

    helper_method :current_student, :logged_in?
    def current_student
        @current_student ||= Student.find(session[:current_student_id]) if session[:current_student_id]
    end

    def logged_in?
        !!current_student
    end

    def require_user 
        if !logged_in?
            redirect_to login_path
        end
    end
end
