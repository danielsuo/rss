class UsersController < ApplicationController
	def new
		if signed_in?
			flash[:error] = "Already signed in!"
			redirect_to current_user
		else
			@user = User.new
		end
	end

	def index
		@users = User.all
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			sign_in @user
			flash[:success] = "Welcome!"
			redirect_to @user
			@user.create_dashboard()
		else
			render 'new'
		end
	end

		def show
		@user = User.find(params[:id])
		# raise @user.to_yaml
	end

	def add_twitter
		# raise env['omniauth.auth'].to_yaml
		@user = current_user

		@user.twitter_oauth_token = env['omniauth.auth']['credentials']['token']
		@user.twitter_oauth_secret = env['omniauth.auth']['credentials']['secret']
		@user.twitter_handle = env['omniauth.auth']['info']['nickname']
		@user.twitter_uid = env['omniauth.auth']['uid']
	
		if @user.save
			flash[:success] = "Twitter added!"
		else
			flash[:error] = "Fail" # TODO: update to catch oauth errors
			raise @user.errors.to_yaml
		end
		render :template => 'users/show'
	end

	def add_pocket
		@user = current_user

		@user.pocket_oauth_token = env['omniauth.auth']['credentials']['token']
		@user.pocket_handle = env['omniauth.auth']['info']['nickname']

		if @user.save
			flash[:success] = "Pocket added!"
		else
			flash[:error] = "Fail" # TODO: update to catch oauth errors
			raise @user.errors.to_yaml
		end
		render :template => 'users/show'
	end

	def add_readability
		@user = current_user

		# raise env['omniauth.auth'].to_yaml

		@user.readability_oauth_token = env['omniauth.auth']['credentials']['token']
		@user.readability_oauth_secret = env['omniauth.auth']['credentials']['secret']
		@user.readability_handle = env['omniauth.auth']['uid']

		# @user.pocket_oauth_token = env['omniauth.auth']['credentials']['token']
		# @user.pocket_handle = env['omniauth.auth']['info']['nickname']

		if @user.save
			flash[:success] = "Readability added!"
		else
			flash[:error] = "Fail" # TODO: update to catch oauth errors
			raise @user.errors.to_yaml
		end
		render :template => 'users/show'
	end
end
