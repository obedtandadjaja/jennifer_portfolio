class AttachmentsController < ApplicationController
	before_action :authenticate_user!, :except => [:show]
	before_filter :set_admin_page, :except => [:show]

	def set_admin_page
		@admin_page = true
	end

	def index
		@attachments = Attachment.all
		@attachments.each do |a|
			puts a.to_json
		end
	end

	def show
		@attachment = Attachment.find(params[:id])
	end

	def new
		@attachment = Attachment.new
	end

	def create
		if params[:attachment]['image']
			@attachment = Attachment.create!(attachment_params)
			if @attachment.save
				flash[:success] = "Attachment successfully added!"
				redirect_to '/attachments'
			else
				flash[:danger] = @attachment.errors.full_messages
				redirect_to '/attachments/new'
			end
		else
			flash[:danger] =  "Missing Image!"
			redirect_to :back
		end
	end

	def destroy
		Attachment.find(params[:id]).destroy
      	redirect_to '/attachments'
	end

	def edit
		@attachment = Attachment.find(params[:id])
	end

	def update
		@attachment = Attachment.find(params[:id])
	    if @attachment.update_attributes(attachment_params)
	      redirect_to :action => 'show', :id => @attachment
	    end
	end

	private
	def attachment_params
		params.require(:attachment).permit(:image, :title, :description, :is_primary, :project_id)
	end

end
