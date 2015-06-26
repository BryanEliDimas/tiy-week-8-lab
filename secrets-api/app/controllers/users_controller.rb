class UsersController < ApplicationController

  def create
    @user = User.new params.require(:user).permit(:email, :name, :password, :password_confirmation)
    @user.key = SecureRandom.hex(8) # generate key and save it with user's info

    if @user.save
      render json: {message: "We good. You're signed up!"}, status: 201
    else
      render json: {message: "Oh no! Couldn't sign you up."}, status: 401
    end
  end

end
