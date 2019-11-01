class CreateQs < ActiveRecord::Migration[5.2]
  def change
    create_table :qs do |t|
      t.references :student, foreign_key: true
      t.references :questionnaire, foreign_key: true

      t.timestamps
    end
  end
end
