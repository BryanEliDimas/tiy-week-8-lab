class SecretsController < ApplicationController
  def index
    @secrets = Secret.all.includes(:user)
  end

  def create
    @secret = Secret.new params.require(:secret).permit(:content, :user_id)

    if @secret.save
      # good
      render status: 201
    else
      # error message
      render json: {message: "Couldn't save new secret. :/ \n #{@user.errors}"}, status: 422
    end
  end
end
