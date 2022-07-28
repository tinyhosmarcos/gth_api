class Status < ApplicationRecord
  belongs_to :user
  belongs_to :property

  enum status_type: { favorite: 0, contact: 1 }

  def owner
    property.owner
  end
end
