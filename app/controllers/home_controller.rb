class HomeController < ApplicationController
	before_action :set_admin_page

	def set_admin_page
		@admin_page = false
	end

	def index
		puts @admin_page
		@user = User.where(first_name: "Jennifer").first
		@projects = @user.project
	end

	def contact
		@user = User.where(first_name: "Jennifer").first
	end

	def about_me
		@user = User.where(first_name: "Jennifer").first
	end

end
