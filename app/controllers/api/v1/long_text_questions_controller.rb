class Api::V1::LongTextQuestionsController < Api::V1::ApplicationController
  def index
    quiz = Quiz.find(params[:id])
    long_text_questions = quiz.long_text_questions

    render json: { long_text_questions: long_text_questions }
  end

  def create
    quiz = Quiz.find(params[:id])
    long_text_question = quiz.long_text_questions.create!(body: params[:long_text_question][:body])

    render json: { id: long_text_question.id}
  end

  # def update
  #   comment = Comment.find(params[:id])
  #   comment.update_attribute(:body, params[:comment][:body])
  #
  #   render json: { id: comment.id }
  # end
end


