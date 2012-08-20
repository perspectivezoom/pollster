class Question < ActiveRecord::Base
  attr_accessible :poll_id, :possible_responses, :question_text, :question_type

  validates_presence_of :question_text
  validates_associated :poll
  validates :possible_responses, :presence => true, :if => :multiple_choice?

  belongs_to :poll
  has_many :answers, :dependent => :destroy

  def multiple_choice?
    question_type == 'multiple_choice'
  end
end