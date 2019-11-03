class RemoveIsOpenFromQuestions < ActiveRecord::Migration[5.2]
  def up
    remove_column :questions, :is_open, :boolean
  end

  def down
  	add_column :questions, :is_open, :boolean
  end
end
