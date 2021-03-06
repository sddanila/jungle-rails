class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user = User.authenticate_with_credentials(params[:session][:email], params[:session][:password])
      log_in user
      redirect_to [:products], notice: 'You logged in!'
    else
      flash.now[:danger] = 'Invalid email/password combination!'
      render 'new'  
    end
  end

  def destroy
    logout
    redirect_to [:products], notice: 'You logged out!'
  end
  
end
