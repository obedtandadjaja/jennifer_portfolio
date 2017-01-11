class UsersController < ApplicationController
	before_action :authenticate_user!
	before_filter :set_admin_page

	def set_admin_page
		@admin_page = true
	end

	def show
		@user = User.where(first_name: "Jennifer").first
		# render '/home/about_me'
	end

	def edit
		@user = User.where(first_name: "Jennifer").first
	end

	def update
		@user = User.where(first_name: "Jennifer").first
	    if @user.update_attributes(user_params)
	    	@user.update_attribute(:avatar, params[:user][:avatar])
	      redirect_to :action => 'show', :id => @user.id
	    end
	end

	private
	def user_params
		params.require(:user).permit(:avatar, :first_name, :last_name, :bio, :phone_number, :occupation, :age)
	end
end
