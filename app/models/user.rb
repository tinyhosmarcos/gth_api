class User < ApplicationRecord
  has_secure_token
  has_secure_password

  # associations 
  has_many :properties, dependent: :destroy
  has_many :status, dependent: :destroy

  # validations

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  enum profile_type: { homeseker: 0, landlord: 1 }

  def invalidate_token
    update(token:nil)
  end
end
