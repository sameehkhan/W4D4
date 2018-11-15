class SessionsController < ApplicationController


  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if @user
      login(@user)
      redirect_to bands_url
    else
      render json: ["Invalid Credentials"]
    end
  end

  def destroy
    self.current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end

  def new
    @user = User.new
    render :new
  end
end
