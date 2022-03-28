class Api::V1::SingleChoiceQuestionsController < Api::V1::ApplicationController
  def index
    quiz = Quiz.find(params[:id])
    single_choice_questions = quiz.single_choice_questions

    render json: { single_choice_questions: single_choice_questions }
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



