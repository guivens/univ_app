class StudentsController < ApplicationController
    before_action :find_params, only: [:show, :edit, :update, :destroy]
    skip_before_action :require_user, only: [:new, :create]
    
    def index
        @students = Student.all
    end

    def show
    end

    def new
        @student = Student.new
    end

    def create
        @student = Student.new(permit_params)
        if @student.save
            session[:current_student_id] = @student.id
            flash[:success] = "Student account was successfuly created"
            redirect_to @student
        else
            render "new"
        end
    end

    def edit
    end

    def update
        if @student.update(permit_params)
            flash[:success] = "Your account has been successfuly updated"
            redirect_to @student
        else 
            render "edit"
        end
    end

    def destroy
        @student.destroy
        session[:current_student_id] = nil 
        flash[:success] = "Account has been deleted successfully"
        redirect_to root_path
    end


    private

    def find_params 
        @student = Student.find(params[:id])
    end

    def permit_params
        params.require(:student).permit(:name, :email, :password)
    end

end