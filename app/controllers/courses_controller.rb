class CoursesController < ApplicationController
	before_filter :authorize
	def index
		
	end

	def preview
		@course = Course.find(params[:id])
	end

	def show
	end
end
