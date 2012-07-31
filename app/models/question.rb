class Question < ActiveRecord::Base
  attr_accessible :poll_id, :possible_responses, :question_text, :question_type

  validates_presence_of :question_text

  belongs_to :poll
  has_many :answers, :dependent => :destroy
end
