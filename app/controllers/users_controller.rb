class UsersController < ApplicationController

	def create
		if params[:email] == 'admin@admin.com' && params[:password] == 'admin_test'
			redirect_to admin_root_path
		else
		  redirect_back(fallback_location: root_path)
		end
	end

end
