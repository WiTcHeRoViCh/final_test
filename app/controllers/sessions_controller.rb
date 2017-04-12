class SessionsController < ApplicationController 

  def create
		user = User.find_or_create_by(name: auth_params['info']['name'])
		if user.save
		  session[:user_id] = user.id
		  redirect_to root_path
		else
		  redirect_to root_path
		end    
	end

	def destroy
	  session[:user_id] = nil
	  redirect_to root_path	
	end

	private

  def auth_params
    request.env['omniauth.auth']
  end

end	