class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
   @user = User.new(user_params)
   if @user.save
     redirect_to @user
   end

   def show
     @user = User.find_by(params[:id])
   end

   def edit
     @user = User.find_by(params[:id])
   end

   def update
     @user = User.find_by(params[:id])
     if @user.update(user_params)
       redirect_to @user
   end

   def destroy
     @user = User.find_by(params[:id])
     @user.destroy
     flash[:notice] = "Account Deleted."
     # redirect_to new_user_path

   end

   private

   def user_params
     params.require(:user).permit(
       :name,
       :location,
       :age,
       :relationship,
       :gender
     )
   end

  end
