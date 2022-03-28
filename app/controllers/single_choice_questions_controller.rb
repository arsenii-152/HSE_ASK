class SingleChoiceQuestionsController < ApplicationController
  def new
    @quiz = Quiz.find(params[:quiz_id])
    @single_choice_question = @quiz.single_choice_questions.build
  end

  def create
    @quiz = Quiz.find(params[:quiz_id])
    @single_choice_question = @quiz.single_choice_questions.create(params[:single_choice_question].permit(:title, :body))
    redirect_to quiz_path(@quiz)
  end

end
