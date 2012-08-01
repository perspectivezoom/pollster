class Response < ActiveRecord::Base
  attr_accessible :poll_id, :answers_attributes

  belongs_to :poll
  validates_associated :poll

  has_many :answers, :dependent => :destroy
  accepts_nested_attributes_for :answers

end
