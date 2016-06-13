module Admin
	class ProjectsController < AdminController
		def index
			@projects = Project.all
		end

		def show
			@project = Project.find(params[:id])
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
			@project = Project.find(params[:id])
		end

		def update
			@project = Project.find(params[:id])
			respond_to do |format|
				if @project.update(project_params)
					format.html { redirect_to admin_project_path(@project) }
					format.json { render :show, status: 200, location: @project }
				else
					format.html { render action: "edit", status: 422 }
				end
			end
		end

		private

		def project_params
			params.require(:project).permit(:name, :description, :complete_date)
		end
	end
end