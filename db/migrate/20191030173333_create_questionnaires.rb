class CreateQuestionnaires < ActiveRecord::Migration[5.2]
  def change
    create_table :questionnaires do |t|
      t.string :cid
      t.string :name
      t.references :professor, foreign_key: true

      t.timestamps
    end
  end
end
