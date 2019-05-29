class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def index
    @users = User.filter(params.slice(:username, :location, :age))
  end

  def new
    @user = User.new
  end

  def create
   @user = User.new(user_params)
   if @user.save
   session[:user_id] = @user.id
     redirect_to @user
   else
     flash[:notice] = "Invalid username or password"
     render :new
   end
 end

   def show
     @user = User.find(params[:id])
   end

   def edit
     @user = User.find(params[:id])
   end

   def update
     @user = User.find(params[:id])
     if @user.update(user_params)
       redirect_to @user
     end
   end

   def destroy
     @user = User.find(params[:id])
     @user.destroy
     flash[:notice] = "Account Deleted."
     # redirect_to new_user_path
   end


   private

   def user_params
     params.require(:user).permit(
       :username,
       :location,
       :age,
       :relationship,
       :gender,
       :password
     )
   end

  end
