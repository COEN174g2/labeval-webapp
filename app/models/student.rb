class Student < ApplicationRecord
  has_many :responses
  has_many :qs
  has_many :questionnaires, through: :qs

  validates :studentid, presence: true, uniqueness: true
  has_secure_password
end
