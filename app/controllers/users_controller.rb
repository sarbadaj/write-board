class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if params[:commit] == 'Signup'
      @user = User.new(user_params)
      if @user.save
        redirect_to writeboards_index_path, :notice => "Signed up!"
      else
        render "new"
      end
    elsif params[:commit] == 'Signin'
      user = User.authenticate(params[:user][:email], params[:user][:password])
      if user
        session[:user_id] = user.id
        redirect_to writeboards_index_path, :notice => "Logged in!"
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
