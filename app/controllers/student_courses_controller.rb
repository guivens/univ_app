class StudentCoursesController < ApplicationController 

    def create
        add_course = Course.find(params[:course_id])
        unless current_student.courses.include?(add_course)
            StudentCourse.create(course: add_course, student: current_student)
            flash[:success] = "you have successfuly enrolled #{add_course.name} "
            redirect_to course_path(add_course)

        else
            flash[:danger] = "something went wrong"
            redirect_to courses_path
        end
    end

    def destroy
        desenrollement = StudentCourse.find(params[:student_course_id])
        desenrollement.destroy
        flash[:success] = "Course have been deleted"
    end
end