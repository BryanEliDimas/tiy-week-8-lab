class SecretsController < ApplicationController

  before_action :authorized_user, :valid_api, only: [:create]

  def index
    @secrets = Secret.all.includes(:user).last(20) # latest 20 secrets
  end

  def create
    @secret = Secret.new params.require(:secret).permit(:content)

    if @secret.save
      # good
      render status: 201
    else
      # error message
      render json: {message: "Couldn't save new secret. :/"}, status: 422
    end
  end
end
