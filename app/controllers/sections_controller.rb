class SectionsController < ApplicationController
	def create
		@section = Section.new
		@section.title = params[:title]
		@section.course = Course.find(params[:course_id])
		@section.save

		respond_to do |format|
			format.html {}
			format.js {}
		end
	end
end
