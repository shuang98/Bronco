class CoursesController < ApplicationController
	before_filter :authorize
	def index
		@courses = Course.all
	end
	def new
		
	end
end
