class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :description
      t.boolean :is_open
      t.references :questionnaire, foreign_key: true

      t.timestamps
    end
  end
end
