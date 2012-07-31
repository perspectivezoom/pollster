class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :response_id
      t.integer :question_id
      t.text :answer_text

      t.timestamps
    end
  end
end
