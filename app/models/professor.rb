class Professor < ApplicationRecord
  has_many :questionnaires

  validates :name, presence: true, uniqueness: true
  has_secure_password
  validate :current_password_is_correct,
           if: :validate_password?, on: :update

  def current_password_is_correct
    # For some stupid reason authenticate always returns false when called on self
    if Professor.find(id).authenticate(current_password) == false
      errors.add(:current_password, "is incorrect.")
    end
  end

  def validate_password?
    !password.blank?
  end

  attr_accessor :current_password
end
