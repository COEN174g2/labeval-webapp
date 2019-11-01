class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.integer :choice
      t.string :text
      t.references :response, foreign_key: true
      t.references :question, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
