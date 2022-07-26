class PropertiesController < ApplicationController
  # Skip for developmet, actived for deployment
  skip_before_action :authorize
  before_action :set_property, only: [:show, :update, :destroy]

  # GET /properties
  def index
    properties = Property.where.not( user: current_user )

    render json: PropertySerializer.new(properties).serializable_hash[:data].map{|property| property[:attributes]}, status: :ok
    # render json: properties, serializer: PropertySerializer, status: :ok, except: [:created_at, :updated_at], methods: [:owner, :images_url]
  end

  # GET /properties/1
  def show
    render json: PropertySerializer.new(@property).serializable_hash[:data][:attributes], status: :ok
  end

  # POST /properties
  def create
    @property = Property.new(property_params)

    if @property.save
      render json: PropertySerializer.new(@property).serializable_hash[:data][:attributes], status: :created
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /properties/1
  def update
    if @property.update(property_params)
      render json: PropertySerializer.new(@property).serializable_hash[:data][:attributes], status: :ok 
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  # DELETE /properties/1
  def destroy
    @property.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(:operation_type, :property_type, :price, :maintenance, :address,
                                      :bedrooms_count, :bathrooms_count, :area, :pets_allowed,
                                      :description, :active_published, :user_id)
    end
end
