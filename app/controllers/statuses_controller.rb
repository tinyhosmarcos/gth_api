class StatusesController < ApplicationController
  # before action to set_statuses_with_current_user for index_contacts and index_favorites
  before_action :set_statuses_with_current_user, only: [:index_contacts, :index_favorites, :create]

  # GET /statuses
  def index_contacts
    @statuses = @statuses.where(status_type: "contact")
    render json: StatusSerializer.new(@statuses).serializable_hash[:data].map{|status| status[:attributes]}, status: :ok

  end

  
  def index_favorites
    @statuses = @statuses.where(status_type: "favorite")
    render json: StatusSerializer.new(@statuses).serializable_hash[:data].map{|status| status[:attributes]}, status: :ok
  end

  # POST /statuses
  def create
    status = @statuses.new(status_params)

    if status.save
      render json: status, status: :created, location: status
    else
      render json: status.errors, status: :unprocessable_entity
    end
  end

  # DELETE /statuses/1
  def destroy
    # Need refactor
    status = Status.where(id:params[:id])
    if !status.empty? and status[0].user_id == current_user.id
      status[0].destroy
      render json: status, status: :ok
    else
      render json: { error: "Unauthorized Access" }, status: :not_found
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_statuses_with_current_user
      @statuses = Status.where(user_id:current_user.id)
    end

    # Only allow a list of trusted parameters through.
    def status_params
      params.require(:status).permit(:id, :property_id, :status_type)
    end
end
