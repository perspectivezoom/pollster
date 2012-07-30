class PollsController < ApplicationController

  before_filter :load_poll, :only => [:edit, :show, :update]
  before_filter :authenticate_maker, :only => [:edit, :update]

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(params[:poll])
    if @poll.save
      redirect_to poll_path(@poll)
    else
      redirect_to :back
    end
  end

  def edit
    
  end

  def show
    
  end

  private

    def load_poll
      @poll = Poll.find_by_taker_key(params[:id])
    end

    def authenticate_maker
      unless params[:maker_key] == @poll.maker_key
        redirect_to poll_path(@poll)
      end
    end
end
