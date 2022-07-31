class UsersController < ApplicationController
  # Skip for developmet, actived for deployment
  skip_before_action :authorize, only: :create
  wrap_parameters format: [:json]  
  # POST /users
  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: :created, except: [:password_digest, :created_at, :updated_at]
    else
      render json: user.errors.full_messages , status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if user.update(user_params)
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:name, :email, :phone, :profile_type, :password, :password_confirmation)
    end 
end
