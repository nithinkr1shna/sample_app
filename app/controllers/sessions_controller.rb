class SessionsController < ApplicationController
  def new
    @title = "Sign In"
  end

  def create
   #@ user = User.find_by(email: params[:session][:email].downcase)

   user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    
    Rails.logger.debug("user"+user.to_s)
    if user.nil?
      flash.now[:error] = "invalid email/password combination"
      @title = "SignIn"
      render 'new'
    else
      sign_in user
      redirect_to user
    end
  end

  def destroy
    sign_out
    redirect_to home_path
  end
end
