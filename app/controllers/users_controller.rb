class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to users_path
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.delete
    redirect_to users_path
  end


  private

  def user_params
    params.require(:user).permit(:name, :location, :age, :relationship, :gender)
  end
end
