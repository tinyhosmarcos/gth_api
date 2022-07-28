class StatusSerializer
  include JSONAPI::Serializer
  set_type :property
  attributes :id, :status_type, :owner
  attribute :property do |object|
    property = Property.find(object.property_id)
    PropertySerializer.new(property, {params: {owner: true}}).serializable_hash[:data][:attributes]
  end
end
