class PropertySerializer
  include JSONAPI::Serializer
  attributes :id, :operation_type, :property_type, :price, :maintenance,
             :bedrooms_count, :bathrooms_count, :area, :pets_allowed,
             :description, :active_published,:direction, :owner, :images_url

end
