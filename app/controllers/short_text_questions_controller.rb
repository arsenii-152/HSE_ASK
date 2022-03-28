class ShortTextQuestionsController < ApplicationController

  def new
    @quiz = Quiz.find(params[:quiz_id])
    @short_text_question = @quiz.short_text_questions.build
  end

  def create
    @quiz = Quiz.find(params[:quiz_id])
    @short_text_question = @quiz.short_text_questions.create(params[:short_text_question].permit(:title, :body))
    redirect_to quiz_path(@quiz)
  end

end
