class WriteboardsController < ApplicationController
  def new
    @writeboard = Writeboard.new
  end

  def index
    @writeboards = Writeboard.all
  end

  def create
    @user = User.find(params[:user_id])
    @writeboard = @user.writeboards.create(writeboard_params)
    redirect_to user_writeboards_path(:user_id)
  end

  def edit
    @user = User.find(params[:user_id])
    @writeboard = @user.writeboards.find(params[:id])  
  end

  def show
    @writeboard = Writeboard.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @writeboard = @user.writeboards.find(params[:id])  
    @writeboard.update_attributes(params[:user])
    respond_with @writeboard
  end

  private
    def writeboard_params
      params.require(:writeboard).permit(:title, :body)
    end

end
