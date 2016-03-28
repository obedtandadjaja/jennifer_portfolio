class UsersController < ApplicationController

	def contact
		@user = User.where(first_name: "Jennifer").first
	end

	def about_me
		@user = User.where(first_name: "Jennifer").first
	end

end
