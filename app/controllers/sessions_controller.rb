class SessionsController < ApplicationController
  # Skip for developmet, actived for deployment
  skip_before_action :authorize

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      user.regenerate_token
      render json: user, status: :created, except: [:password_digest, :created_at, :updated_at]
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  def destroy
    current_user.invalidate_token
    head :ok
  end
end