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

  # GET /properties/filter
  def filter
    properties = Property.where.not( user: current_user )
    properties = properties.where(operation_type: params[:operation_type]) if params[:operation_type].class == Integer
    properties = properties.where("price >= :min AND price <= :max", min: params[:price][0], max: params[:price][1]) if params[:price]
    properties = properties.where(property_type: params[:property_type]) if params[:property_type].class == Integer
    properties = properties.where("bathrooms_count >= :min", min: params[:bathrooms_count]) if params[:bathrooms_count].class == Integer
    properties = properties.where("bedrooms_count >= :min", min: params[:bedrooms_count]) if params[:bedrooms_count].class == Integer
    properties = properties.where("area >= :min AND area <= :max", min: params[:area][0], max: params[:area][1]) if params[:area]
    properties = properties.where(pets_allowed: params[:pets_allowed]) if params[:pets_allowed].class != NilClass

    render json: PropertySerializer.new(properties).serializable_hash[:data].map{|property| property[:attributes]}, status: :ok
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
