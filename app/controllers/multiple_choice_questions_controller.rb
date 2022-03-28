class MultipleChoiceQuestionsController < ApplicationController
  def index
    @multiple_choice_questions = MultipleChoiceQuestion.all
  end

  def new
    @quiz = Quiz.find(params[:quiz_id])
    @multiple_choice_question = @quiz.multiple_choice_question.build
  end

  def create
		@quiz = Quiz.find(params[:quiz_id])
		@multiple_choice_question = @quiz.multiple_choice_questions.create(params[:multiple_choice_question].permit(:title))
		redirect_to quiz_path(@quiz)
	end
  def destroy
		@quiz = Quiz.find(params[:quiz_id])
		@multiple_choice_question = @quiz.multiple_choice_questions.find(params[:id])
		@multiple_choice_question.destroy
		redirect_to quiz_path(@quiz)
	end
end
