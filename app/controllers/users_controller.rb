class UsersController < ApplicationController

  before_action :authenticate , :only => [:edit, :update] #only signed in user can edit  profile
  before_action :correct_user, :only => [:edit, :update] #users should not edit others profile
  before_action :admin_user, :only => :destroy

  def index
    @title = "All Users"
    @users = User.paginate(:page =>  params[:page])
  end
  
  def show
    @user = User.find(params[:id])
    @title =@user.name
  end
  
  def new
    @user = User.new
    @title = "SignUp"
  end

  def edit
    @user = User.find(params[:id])
    @title = "Edit User"
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User Deleted"
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user].to_unsafe_hash) #protected by forbidden attributes
      flash[:success] = "Profile Updated"
      redirect_to @user
    else
      @title = "Edit User"
      render 'edit'
    end
  end

  def create
    @user = User.new(allowed_params)
    if @user.save
      sign_in @user
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

  def authenticate
    deny_access unless signed_in?
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  def admin_user
    if not current_user.admin?
      redirect_to(users_path)
    else
      true
    end
  end
  
end
