class Question < ApplicationRecord
  belongs_to :questionnaire
  
  validates :description, presence: true
end
