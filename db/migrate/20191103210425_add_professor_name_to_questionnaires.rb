class AddProfessorNameToQuestionnaires < ActiveRecord::Migration[5.2]
  def change
    add_column :questionnaires, :pname, :string
  end
end
