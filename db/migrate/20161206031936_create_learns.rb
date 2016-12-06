class CreateLearns < ActiveRecord::Migration[5.0]
  def change
    create_table :learns do |t|
      t.references :question, foreign_key: true
      t.references :answer, foreign_key: true
      t.references :lesson, foreign_key: true
      t.boolean :is_correct

      t.timestamps
    end
  end
end
