class AddIndexToResponses < ActiveRecord::Migration[5.2]
  def change
  	add_index :responses, [:questionnaire_id, :student_id], unique: true
  end
end
