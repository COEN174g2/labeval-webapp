class Q < ApplicationRecord
  belongs_to :student
  belongs_to :questionnaire

  validates :student, uniqueness: true
end
