class Answer < ActiveRecord::Base
  attr_accessible :response_id, :question_id, :answer_text

  belongs_to :response
  belongs_to :question
end
