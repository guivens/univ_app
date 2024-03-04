class CoursesController < ApplicationController
    skip_before_action :require_user, only: [:new, :create, :index]

    def index
        @courses = Course.all
    end

    def show
        @course = Course.find(params[:id])
    end

    def new
        @course = Course.new
    end

    def create
        @course = Course.new(config_params)
        if @course.save
            flash[:notice] = "Course created successfuly"
            redirect_to @course
        else
            render "new"
        end
    end

    private

    def config_params
        params.require(:course).permit(:short_name, :name, :description, :course_image)

    end



end
