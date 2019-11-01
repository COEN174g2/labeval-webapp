class DropQuestionnairesStudents < ActiveRecord::Migration[5.2]
  def change
  	drop_table :questionnaires_students
  end
end
