class SectionsController < ApplicationController
	def create
		@section = Section.new
		@section.title = params[:title]
		@section.course = Course.find(params[:course_id])
		@section.save
		@course = @section.course
		@sections = Section.all
		respond_to do |format|
			format.html {}
			format.js {}
		end
	end

	def update
		@section = Section.find(params[:id])
		@section.update(section_params)
		respond_to do |format|
			format.html {}
			format.js {}
		end
	end
	def buildbody
		@section = Section.find(params[:section_id])
		puts @section.title
		@body = Body.new
		@body.section = @section
		@body.save
		@course = @section.course
		render partial: "courses/section_form", locals: {section: @section}
	end
	private
		def section_params
			params.require(:section).permit(bodies_attributes: [:id, :body])
		end
end
