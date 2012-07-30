class PollsController < ApplicationController

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

  def show
    @poll = Poll.find_by_taker_key(params[:id])
  end

end
