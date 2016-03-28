class HomeController < ApplicationController

	def index
		@user = User.where(first_name: "Jennifer").first
		@projects = @user.project
	end

end
