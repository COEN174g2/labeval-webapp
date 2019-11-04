class Questionnaire < ApplicationRecord
  belongs_to :professor, optional: true
  has_many :questions
  has_many :qs
  has_many :students, through: :qs

  validates :cid, :name, :pname, presence: true
  validates :cid, uniqueness: { scope: :pname }
end
