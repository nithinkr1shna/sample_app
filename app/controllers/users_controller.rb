class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @title =@user.name
  end
  
  def new
    @user = User.new
    @title = "SignUp"
  end

  def create
    @user = User.new(allowed_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App"
      redirect_to @user
    else
      @title = "Sign Up"
      render 'new'
    end
  end

  private
  def allowed_params
    params.require(:user).permit(:name, :email, :password)
  end
  
end
