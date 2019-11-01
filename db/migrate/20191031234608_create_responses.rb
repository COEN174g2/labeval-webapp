class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.string :cid
      t.references :student, foreign_key: true
      t.references :questionnaire, foreign_key: true

      t.timestamps
    end
  end
end
