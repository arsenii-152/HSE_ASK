class QuestionOptionsController < ApplicationController
  def index
    @question_options = QuestionOption.all
  end

  def new
    @question = SingleChoiceQuestion.find(params[:single_choice_question_id]) && MultipleChoiceQuestion.find(params[:multiple_choice_question_id])
    @question_option = @question.question_options.build
  end

  def create
    @question = SingleChoiceQuestion.find(params[:single_choice_question_id]) && MultipleChoiceQuestion.find(params[:multiple_choice_question_id])
    @question_option = @question.question_options.create(params[:question_option].permit(:body))
		redirect_to quiz_path(@question)
	end
  def destroy
    @question = SingleChoiceQuestion.find(params[:single_choice_question_id]) && MultipleChoiceQuestion.find(params[:multiple_choice_question_id])
    @question_option = @question.question_options.create(params[:id])
		@question_option.destroy
		redirect_to quiz_path(@question)
	end
end
