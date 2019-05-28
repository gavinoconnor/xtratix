class SessionsController < ApplicationController
 skip_before_action :authorized, only: [:new, :create, :destroy]

 def new
   render :new #looks in app/views/sessions/new.html.erb
 end

 def create
   @user = User.find_by(username: params[:username])

   if @user && @user.authenticate(params[:password])
     # once we have found the user, create a new session for them
     session[:user_id] = @user.id
     # redirect_to user_path(@user)
     redirect_to @user
   else
     flash[:notice] = 'Invalid username or password'
     redirect_to login_path
   end
 end

 def destroy
   session.delete(:user_id)
   session[:user_id] = nil
   flash[:notice] = 'You are logged out'
   redirect_to login_path
 end
end
