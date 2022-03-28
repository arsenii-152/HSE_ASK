class Api::V1::LongTextQuestionsController < Api::V1::ApplicationController
  def index
    quiz = Quiz.find(params[:id])
    long_text_questions = quiz.long_text_questions

    render json: { long_text_questions: long_text_questions }
  end

  # def create
  #   post = Post.find(params[:id])
  #   comment = post.comments.create!(body: params[:comment][:body], user: current_user)
  #
  #   render json: { id: comment.id, tempId: params[:tempId] }
  # end
  #
  # def update
  #   comment = Comment.find(params[:id])
  #   comment.update_attribute(:body, params[:comment][:body])
  #
  #   render json: { id: comment.id }
  # end
end


