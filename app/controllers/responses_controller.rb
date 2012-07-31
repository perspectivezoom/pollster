class ResponsesController < ApplicationController
  def create
    @answers = params[:response].delete(:answers_attributes).values
    @response = Response.new(params[:response])
    if @response.save
      cookies[@response.poll.taker_key] = true
      @answers.each do |answer_params|
        @response.answers.create(answer_params) unless answer_params[:answer_text].empty?
      end
      flash[:success] = 'Thanks for your input!'
    else
      flash[:error] = @response.errors.full_messages.first
    end
    redirect_to :back
  end
end
