class UsersController < ApplicationController
  before_action :redirect_not_logged_in, only: [:index, :show, :destroy]
  before_action :admin_user?, only: [:index]

  def index
      @users =User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :address, :admin, :photo)
  end

end
