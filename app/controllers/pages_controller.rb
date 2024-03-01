class PagesController < ApplicationController

    def home
        @student = Student.all
    end
    
end