class SessionsController < ApplicationController 
    def new 
    end

    def create
        student = Student.find_by(email: params[:session][:email].downcase)
        if student && student.authenticate(params[:session][:password])
            session[:current_student_id] = student.id
            flash[:success] = "you have been logged in"
            redirect_to student
        else
            flash.now[:danger] = "there was a problem with your email or password"
            render 'new'
        end
    end

end