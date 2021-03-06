class CoursesController < ApplicationController
    
    def index
        # @courses = Course.all.order(title: :desc)
        @courses = Course.all
    end
    
    def assign
         u = User.find(params[:user_id])
         a = u.courses.ids
         @courses = Course.where('id NOT IN (?)', a)
        # @courses = Course.all
    end

    def show
        @course = Course.find(params[:id])
        @user = User.find(params[:user_id]) rescue nil
    end

    def new
        @course = Course.new
    end

    def create
        @course = Course.new(course_params)
        if @course.save
          redirect_to courses_path
        else
          render :new, status: :unprocessable_entity
        end
    end

    private 
    def course_params
        params.require(:course).permit(:title,:description)
    end
end