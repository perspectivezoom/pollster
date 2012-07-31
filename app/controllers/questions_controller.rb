class QuestionsController < ApplicationController

  def create
    @question = Question.new(params[:question])
    respond_to do |format|
      if @question.save
        flash[:error] = nil
        flash[:success] = 'Question Added Below'
        format.js
      else
        flash[:error] = @question.errors.full_messages.first
        format.js
      end
    end
  end

  def update
    @question = Question.find(params[:id])
    respond_to do |format|
      if @question.update_attributes(params[:question])
        flash[:error] = nil
        flash[:success] = 'Question Updated'
        format.js 
      else
        flash[:error] = @question.errors.full_messages.first
        format.js
      end
    end
  end

  def destroy
    @question = Question.find(params[:id])
    respond_to do |format|
      if @question.destroy
        flash[:error] = nil
        flash[:success] = 'Question deleted'
        format.js
      else
        flash[:error] = @question.errors.full_messages.first
        format.js
      end
    end
  end

end
