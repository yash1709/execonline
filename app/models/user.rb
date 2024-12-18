class User < ApplicationRecord
  belongs_to :organization

  validates :first_name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :last_name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :organization_id, presence: true, numericality: { only_integer: true}
  validates :role, presence: true, numericality: { only_integer: true }
  
  enum role: { student: "student", coach: "coach", admin: "admin", super_admin: "super_admin" }

  
  # Helper methods to check role
  def student?
    role == "student"
  end

  def coach?
    role == "coach"
  end

  def admin?
    role == "admin"
  end

  def super_admin?
    role == "super_admin"
  end

end
