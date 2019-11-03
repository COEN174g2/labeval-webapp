class Professor < ApplicationRecord
  has_many :questionnaires

  validates :name, presence: true, uniqueness: true
  has_secure_password
  validate :current_password_is_correct,
           if: :validate_password?, on: :update
    validate :token_is_correct,
           if: :validate_token?, on: :new

  def current_password_is_correct
    # For some stupid reason authenticate always returns false when called on self
    if Professor.find(id).authenticate(current_password) == false
      errors.add(:current_password, "is incorrect.")
    end
  end

  def token_is_correct
    if token != "s3kr3t"
      errors.add(:token, "is incorrect.")
    end
  end

  def validate_password?
    !password.blank?
  end

  def validate_token?
    !token.blank?
  end

  attr_accessor :current_password
end
