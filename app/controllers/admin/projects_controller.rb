module Admin
	class ProjectsController < AdminController
		before_filter :find_project, only: [:show, :edit, :update, :complete, :destroy]

		def index
			@projects = Project.all.order('complete_date DESC')
		end

		def show
		end

		def new
			@project = Project.new
		end

		def create
			@project = Project.new(project_params)

			respond_to do |format|
				if @project.save
					format.html { redirect_to admin_project_path(@project) }
					format.json { render :show, status: 200, location: @project }
				else
					format.html { render action: "new", status: 422 }
				end
			end
		end

		def edit
		end

		def update
			respond_to do |format|
				if @project.update(project_params)
					format.html { redirect_to admin_project_path(@project) }
					format.json { render :show, status: 200, location: @project }
				else
					format.html { render action: "edit", status: 422 }
				end
			end
		end

		def destroy
			@project.destroy
			redirect_to admin_projects_path
		end

		def complete
			@project.update complete_date: Date.current
			redirect_to admin_projects_path
		end

		private

		def project_params
			params.require(:project).permit(:name, :description, :complete_date, :main_image, :main_image_file_name, :main_image_content_type, :main_image_file_size, :main_image_updated_at))
		end

		def find_project
			@project = Project.find(params[:id])
		end
	end
end