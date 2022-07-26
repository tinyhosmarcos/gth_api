class Property < ApplicationRecord
  before_save :set_location
  
  # associations
  belongs_to :user
  has_many :status, dependent: :destroy
  has_many_attached :images, dependent: :destroy
  # validations
  
    enum operation_type: { rent: 0, sale: 1 }
    enum property_type: { apartment: 0, house: 1 }
  
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :maintenance, presence: true, numericality: { greater_than: 0 }
  validates :bedrooms_count, presence: true, numericality: { greater_than: 0 }
  validates :bathrooms_count, presence: true, numericality: { greater_than: 0 }
  validates :area, presence: true, numericality: { greater_than: 0 }
  validates :pets_allowed, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :user, presence: true
  
  def owner
    {
      id: user.id,
      name: user.name,
      email: user.email,
      phone: user.phone
    }
  end 

  def set_location
    results = Geocoder.search(address)
    return if results.present?
    
    self.latitude = results.first.coordinates[0]
    self.longitude = results.first.coordinates[1]
  end

  def images
    images.map{ |image| Rails.application.routes.url_helpers.url_for(image) } if images.attached?
  end

end
