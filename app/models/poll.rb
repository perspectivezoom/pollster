class Poll < ActiveRecord::Base
  attr_accessible :maker_key, :name, :taker_key
  validates_presence_of :maker_key, :name, :taker_key
  validates_uniqueness_of :maker_key, :name, :taker_key

  before_validation :generate_keys

  has_many :questions

  def to_param
    self.taker_key
  end

  private

    def generate_keys
      self.maker_key ||= generate_keystring
      self.taker_key ||= generate_keystring
    end

    def generate_keystring
      char_bank = ('a'..'z').to_a + (1..9).to_a - %w(o l 1 i)
      Array.new(8,'A').map {char_bank[rand(char_bank.length - 1)]}.join
    end

end
