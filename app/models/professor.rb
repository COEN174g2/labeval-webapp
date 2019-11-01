class Professor < ApplicationRecord
  has_many :questionnaires

  validates :name, presence: true, uniqueness: true
  has_secure_password
end
