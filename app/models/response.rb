class Response < ApplicationRecord
  belongs_to :student
  belongs_to :questionnaire
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers

  validates :cid, presence: true
  validates :questionnaire_id, uniqueness: { scope: :student_id }
end
