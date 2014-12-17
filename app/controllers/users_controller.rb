class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if params[:commit] == 'Signup'
      @user = User.new(user_params)
      if @user.save
        redirect_to user_writeboards_path(:user_id), :notice => "Signed up!"
      else
        render "new"
      end
    elsif params[:commit] == 'Signin'
      user = User.find_by_email(params[:user][:email])
      if User.authenticate(params[:user][:email], params[:user][:password])
        if params[:remember_me]
          cookies.permanent[:auth_token] = user.auth_token
        else
          cookies[:auth_token] = user.auth_token
        end
        redirect_to user_writeboards_path(:user_id), :notice => "Logged in!"
      else
        flash.now.alert = "Invalid email or password"
        redirect_to root_url
      end
    end
      
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url, :notice => "Logged out!"
  end
  
  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
