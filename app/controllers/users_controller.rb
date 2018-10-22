class UsersController < ApplicationController

  before_action :authenticate_user!

  def new
  end

  def show
  # @user = current_user
    @user = User.find(params[:id])
  	@cardlists = Cardlist.where(user_id: @user.id)
  end

  def index
  #	@user = current_user
  	@users = User.all
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	user = User.find(params[:id])
  	user.update!(user_params)
  	redirect_to user_path(user.id)
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :email, :image)
  end
end
