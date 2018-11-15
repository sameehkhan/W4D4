class SessionsController < ApplicationController


  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if @user
      login(@user)
      render json: ["Session Started"]
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
    render :new
  end
end
