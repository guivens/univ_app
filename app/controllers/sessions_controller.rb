class SessionsController < ApplicationController 
    skip_before_action :require_user, only: [:new, :create]


    def new 
    end

    def create
        student = Student.find_by(email: params[:session][:email].downcase)
        if student && student.authenticate(params[:session][:password])
            session[:current_student_id] = student.id
            flash[:success] = "you have been logged in"
            redirect_to student
        else
            flash[:danger] = "there was a problem with your email or password"
            redirect_to root_path
        end
    end

    def destroy
        session[:current_student_id] = nil
        flash[:success] = "Logged out"
        redirect_to root_path
    end

end