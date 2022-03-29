class Api::V1::ShortTextQuestionsController < Api::V1::ApplicationController
  def index
    quiz = Quiz.find(params[:id])
    short_text_questions = quiz.short_text_questions

    render json: { short_text_questions: short_text_questions }
  end

  def create
    quiz = Quiz.find(params[:id])
    short_text_question = quiz.short_text_questions.create!(body: params[:short_text_question][:body])

    render json: { id: short_text_question.id}
  end

  # def update
  #   comment = Comment.find(params[:id])
  #   comment.update_attribute(:body, params[:comment][:body])
  #
  #   render json: { id: comment.id }
  # end
end

