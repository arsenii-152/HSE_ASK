class Api::V1::ShortTextQuestionsController < Api::V1::ApplicationController
  def index
    quiz = Quiz.find(params[:id])
    short_text_questions = quiz.short_text_questions

    render json: { short_text_questions: short_text_questions }
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

