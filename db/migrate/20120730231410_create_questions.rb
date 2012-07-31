class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :poll_id
      t.string :question_text
      t.string :question_type
      t.string :possible_responses

      t.timestamps
    end
  end
end
