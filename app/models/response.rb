class Response < ApplicationRecord
  belongs_to :student
  belongs_to :questionnaire
  has_many :answers, dependent: :destroy

  validates :cid, presence: true, uniqueness: true
end
