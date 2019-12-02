class AddStudentIdToQuestionnaires < ActiveRecord::Migration[5.2]
  def change
  	add_column :questionnaires, :studentid, :string
  	add_column :questionnaires, :student_id, :integer
  end
end
