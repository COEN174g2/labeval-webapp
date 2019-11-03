class Answer < ApplicationRecord
  belongs_to :response
  belongs_to :question
  belongs_to :student
  validates_presence_of :response

  def self.to_csv
  	attributes = %w{id choice text response_id question_id student_id created_at updated_at}
  	CSV.generate(headers: true) do |csv|
  		csv << attributes

  		all.each do |question|
  			csv << question.attributes.values_at(*attributes) #unpack
  		end
  	end
  end
end
