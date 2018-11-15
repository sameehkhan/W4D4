class UsersController < ApplicationController


  def new
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: 422
    end
  end


  def show
    
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
