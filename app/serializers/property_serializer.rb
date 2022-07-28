class PropertySerializer
  include JSONAPI::Serializer
  attributes :id, :operation_type, :property_type, :price, :maintenance,
             :bedrooms_count, :bathrooms_count, :area, :pets_allowed,
             :description, :active_published,:direction, :images_url
  attribute :owner, if: Proc.new {|record, params| params.none?}

end
