class ImagesController < ApplicationController

	def index
		@images = Image.all
	end

	def show
		@image = Image.find(params[:id])
	end

	def new
		@projects = Project.all
	end

	def create
		@image = Image.create( image_params )
	end

	private

	# Use strong_parameters for attribute whitelisting
	# Be sure to update your create() and update() controller methods.

	def image_params
		params.require(:image).permit(:picture)
	end

end
