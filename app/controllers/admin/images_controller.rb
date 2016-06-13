module Admin
	class ImagesController < AdminController

		before_filter :set_project

		def new
			@image = @project.images.new
		end

		def create
			@image = @project.images.new(image_params)

			respond_to do |format|
				if @image.save
					format.html { redirect_to admin_project_path(@project), :success => "Image added successfully" }
				end
			end
		end

		private

		def image_params
			params.require(:image).permit(:name, :description, :image_attach, :image_attach_file_name, :image_attach_content_type, :image_attach_file_size, :image_attach_updated_at)
		end

		def set_project
			@project = Project.find(params[:project_id])
		end

	end
end