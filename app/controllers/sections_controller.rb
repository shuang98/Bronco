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

	def update
		@section = Section.find(params[:id])
		@section.update(section_params)
	end
	private
		def section_params
			params.require(:section).permit(bodies_attributes: [:id, :body])
		end
end
