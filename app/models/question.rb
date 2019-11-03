class Question < ApplicationRecord
  belongs_to :questionnaire
  
  validates :description, presence: true

  def self.to_csv
  	attributes = %w{id description questionnaire_id created_at updated_at q_type}
  	CSV.generate(headers: true) do |csv|
  		csv << attributes

  		all.each do |question|
  			csv << question.attributes.values_at(*attributes) #unpack
  		end
  	end
  end
end
