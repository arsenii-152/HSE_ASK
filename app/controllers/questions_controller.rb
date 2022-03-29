class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.build
  end

  def create
		@quiz = Quiz.find(params[:quiz_id])
		@question = @quiz.questions.create(params[:question].permit(:title))
		redirect_to quiz_path(@quiz)
	end
end
