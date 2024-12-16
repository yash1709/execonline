class Program < ApplicationRecord
  belongs_to :organization

  has_many :enrollments, dependent: :destroy
  has_many :users, through: :enrollments

  validates :name, presence: true, length: { minimum: 3, maximum: 50}
  validates :start_date, presence: true
  validates :end_date, presence: true
end
