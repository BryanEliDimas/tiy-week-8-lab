class SecretsController < ApplicationController
  before_action do
    authorized_user
  end

  before_action do
    valid_api
  end

  def index
    @secrets = Secret.all.includes(:user)
  end

  def create
    @secret = Secret.new params.require(:secret).permit(:content)

    if @secret.save
      # good
      render status: 201
    else
      # error message
      render json: {message: "Couldn't save new secret. :/ \n #{@user.errors}"}, status: 422
    end
  end
end
