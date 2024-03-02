class ApplicationController < ActionController::Base

    helper_method :current_student, :logged_in?
    def current_student
        @current_student ||= Student.find(session[:current_student_id]) if session[:current_student_id]
    end

    def logged_in?
        !!current_student
    end
end
