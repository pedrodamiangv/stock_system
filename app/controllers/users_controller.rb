class UsersController < ApplicationController
  before_action :authenticate_user!
  
  # GET /users
  # GET /users.json
  def index
    @users = User.paginate(:page => params[:page], :per_page => 5)
  end

  # GET /resource/1
  # GET /resource/1.json
  def show
  	@user = User.find(params[:id])
  end

end