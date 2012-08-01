require 'spec_helper'

describe Poll do
  before :each do
    Poll.delete_all
    @poll = Poll.new(:name => 'happy')
  end

  context 'intialization' do
    it 'builds with a name' do
      @poll.save
      Poll.first.name.should eq 'happy'
    end

    it 'errors without a name' do
      poll = Poll.new(:name => nil)
      expect{ poll.save! }.to raise_error
    end

    it 'generates a maker key upon save' do
      @poll.maker_key.nil?.should eq true
      @poll.save
      @poll.maker_key.nil?.should eq false
    end

    it 'generates a taker key upon save' do
      @poll.taker_key.nil?.should eq true
      @poll.save
      @poll.maker_key.nil?.should eq false
    end
  end

  describe '#to_param' do
    it 'has a to_param method that gives the taker_key as the id' do
      @poll.save
      @poll.taker_key.nil?.should eq false
      @poll.to_param.should eq @poll.taker_key
    end
  end
end