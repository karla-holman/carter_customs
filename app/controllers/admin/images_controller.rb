module Admin
	class ImagesController < AdminController
		before_filter :find_image, only: [:edit, :update, :destroy]
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

		def edit
		end

		def update
			respond_to do |format|
				if @image.update(image_params)
					format.html { redirect_to admin_project_path(@project) }
					format.json { render :show, status: 200, location: @project }
				else
					format.html { render action: "edit", status: 422 }
				end
			end
		end

		def destroy
			@image.destroy
   		redirect_to @project
		end

		private
		def image_params
			params.require(:image).permit(:name, :description, :image_attach, :image_attach_file_name, :image_attach_content_type, :image_attach_file_size, :image_attach_updated_at)
		end

		def set_project
			@project = Project.find(params[:project_id])
		end

		def find_image
			@image = Image.find(params[:id])
		end
	end
end