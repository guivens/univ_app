class CoursesController < ApplicationController
    def index
        @courses = Course.all
    end

    def new
        @course = Course.new
    end

    def create
        @course = Course.new(config_params)
        if @course.save
            flash[:notice] = "Course created successfuly"
            redirect_to @courses
        else
            render "new"
        end
    end

    private

    def config_params
        params.require(:course).permit(:short_name, :name, :description, :image_course)

    end



end
