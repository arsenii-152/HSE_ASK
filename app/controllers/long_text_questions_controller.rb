class LongTextQuestionsController < ApplicationController
  def index
    @long_text_questions = LongTextQuestion.all
  end

  def new
    @quiz = Quiz.find(params[:quiz_id])
    @long_text_question = @quiz.long_text_questions.build
  end

  def create
		@quiz = Quiz.find(params[:quiz_id])
		@long_text_question = @quiz.long_text_questions.create(params[:long_text_question].permit(:title, :body))
		redirect_to quiz_path(@quiz)
	end
  def destroy
		@quiz = Quiz.find(params[:quiz_id])
		@long_text_question = @quiz.long_text_questions.find(params[:id])
		@long_text_question.destroy
		redirect_to quiz_path(@quiz)
	end
end
