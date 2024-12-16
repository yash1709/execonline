class User < ApplicationRecord
  belongs_to :organization

  validates :first_name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :last_name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :organization_id, presence: true, numericality: { only_integer: true}
  validates :role, numericality: { only_integer: true, allow_nil: true }
  
end
