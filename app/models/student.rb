class Student < ApplicationRecord
  has_many :responses
  has_many :qs
  has_many :questionnaires
  has_many :questionnaires, through: :qs

  validates :studentid, presence: true, uniqueness: true
  has_secure_password

  validate :current_password_is_correct,
           if: :validate_password?, on: :update

  def current_password_is_correct
    # For some stupid reason authenticate always returns false when called on self
    if Student.find(id).authenticate(current_password) == false
      errors.add(:current_password, "is incorrect.")
    end
  end

  def validate_password?
    !password.blank?
  end

  attr_accessor :current_password
end
