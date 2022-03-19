class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end
  def create
		@quiz = Quiz.find(params[:quiz_id])
		@question = @quiz.questions.create(params[:question].permit(:title, :body))
		redirect_to quiz_path(@quiz)
	end
end
