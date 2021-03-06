class WelcomeController < ApplicationController

	def index  
		
	end

	def after_oauth
		app_id = "2e5707af768f036723e457c349e872640a2f32d0508a981b55a5730c5725796d"
		secret_id = "fa23c84150ce1623d4ee1b20d0eea7a8a4a325a173efb405d395b3d8c8fa66d1"
		callback = "http://localhost:4000/after_oauth"
		site = "http://localhost:3000"
		@oauth_client = OAuth2::Client.new(app_id, secret_id, site: site)
		
		if params[:code].present?
			token = @oauth_client.auth_code.get_token(params[:code], :redirect_uri => callback)
			response = token.get('/api/v1/me.json')
			render :json => response.body
		else
			authorize_url = @oauth_client.auth_code.authorize_url(redirect_uri: callback)
			redirect_to authorize_url
		end
	end

end
