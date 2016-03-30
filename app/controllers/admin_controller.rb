class AdminController < ApplicationController
before_filter :set_admin_page

	def set_admin_page
		@admin_page = true
	end

end
