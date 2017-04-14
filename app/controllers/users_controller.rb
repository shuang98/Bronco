class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to courses_path
		else
			render 'new'
		end
	end
	
	def index
		
	end

	def search
		if params[:search] && params[:search].length > 0
        	params[:search].downcase!
        	#@results = User.where('LOWER(username) LIKE ?', "%#{params[:search]}%")
			@results = User.all
			render 'search'
		else
			render 'index'
    	end
	end


	private
		def user_params
			params.require(:user).permit(:username, :email, :password, :password_confirmation)
		end
	def show
	end	
end
