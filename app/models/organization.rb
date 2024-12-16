class Organization < ApplicationRecord
  has_many :programs, dependent: :destroy
  has_many :users, dependent: :destroy

  validates :name, presence: true, length: { minimum: 10, maximum: 100}

end