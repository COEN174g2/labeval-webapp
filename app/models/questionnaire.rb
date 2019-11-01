class Questionnaire < ApplicationRecord
  belongs_to :professor
  has_many :questions
  has_many :qs
  has_many :students, through: :qs

  validates :cid, :name, presence: true
  validates :cid, uniqueness: true
end
