class AddUniqueIndexToQuestionnaires < ActiveRecord::Migration[5.2]
  def change
  	add_index :questionnaires, [:cid, :pname], unique: true
  end
end
