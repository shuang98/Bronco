class CoursesController < ApplicationController
	before_filter :authorize
	def index
		@courses = Course.all
	end

	def new
		@course = Course.new
	end

	def create
		@course = Course.new(course_params)
		@course.user = current_user
		if @course.save
			redirect_to edit_course_path(@course.id)
		else
			render 'new'
		end
	end

	def edit
		@course = Course.find(params[:id])
		@sections = @course.sections
	end

	def preview
		@course = Course.find(params[:id])
	end

	def show
	end
	
	private
		def course_params
			params.require(:course).permit(:title, :description)
		end

	
end
