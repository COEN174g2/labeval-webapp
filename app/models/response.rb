class Response < ApplicationRecord
  belongs_to :student
  belongs_to :questionnaire
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true

  validates :cid, presence: true, uniqueness: true
end
