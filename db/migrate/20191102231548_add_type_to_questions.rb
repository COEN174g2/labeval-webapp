class AddTypeToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :type, :integer
  end
end
