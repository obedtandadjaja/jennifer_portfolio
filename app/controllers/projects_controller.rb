class ProjectsController < ApplicationController
	before_action :authenticate_user!, :except => [:show, :index]
	before_filter :set_admin_page, :except => [:show, :index]

	def set_admin_page
		@admin_page = true
	end

	def index
		@projects = Project.all
	end

	def show
		@projects = Project.find(params[:id])
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.create(project_params)
		if @project.save
			if params[:project]['image']
				params[:project]['image'].each do |image|
		          	@image = Attachment.create!(project_id: @project.id, image: image)
		        end
	    	end
			redirect_to :action => :index
		else
			flash[:notice] = "The form you submitted is invalid."
			redirect_to '/projects/new'
		end
	end

	def destroy
		Project.find(params[:id]).destroy
      	redirect_to '/projects'
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update
		@project = Project.find(params[:id])
	    if @project.update_attributes(project_params)
	    	# delete all attachments first and then readding them
	    	@project.attachment.destroy_all
	    	if params[:project]['image']
		    	params[:project]['image'].each do |image|
		          	@image = Attachment.create!(project_id: @project.id, image: image)
		        end
	    	end
	      	redirect_to :action => 'show', :id => @project
	  	else
	  		flash[:notice] = "The form you submitted is invalid."
			redirect_to :action => :edit, :id => @project
	    end
	end

	private
	def project_params
		params.require(:project).permit(:title, :subtitle, :description_brief, :description_long, :user_id, :images)
	end

end
