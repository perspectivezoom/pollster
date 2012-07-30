class PollsController < ApplicationController

  before_filter :load_poll, :only => [:edit, :show, :update]
  before_filter :authenticate_maker, :only => [:edit, :update]

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(params[:poll])
    if @poll.save
      flash[:success] = 'Poll created. Time to create some questions'
      redirect_to poll_path(@poll)
    else
      flash[:error] = @poll.errors.full_messages.first
      redirect_to :back
    end
  end

  def edit
    if @poll.update_attributes(params[:poll])
      flash[:sucess] = 'Poll edited'
      redirect_to poll_path(@poll)
    else
      flash[:error] = @poll.errors.full_messages.first
      redirect_to :back
    end
  end

  def show
  end

  private

    def load_poll
      @poll = Poll.find_by_taker_key(params[:id])
    end

    def authenticate_maker
      unless params[:maker_key] == @poll.maker_key
        flash[:error] = 'Please provide your maker key to edit this poll'
        redirect_to poll_path(@poll)
      end
    end
end
