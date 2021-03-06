class QuizzesController < ApplicationController
  before_action :authenticate_user!, exept: %i[ index show ]
  before_action :set_quiz, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token


  # GET /quizzes or /quizzes.json
  def index
    @quizzes = Quiz.all
  end

  # GET /quizzes/1 or /quizzes/1.json
  def show
    # Находим Квиз
    @quiz = Quiz.find(params[:id])

    # Находим все вопросы внутри и определяем вопрос
    @single_choice_questions = @quiz.single_choice_questions
    # @single_choice_question =  @quiz.single_choice_questions.find([:multiple_choice_questions_attributes][:quiz_id])

    @multiple_choice_questions = @quiz.multiple_choice_questions
    # @multiple_choice_question =  @quiz.multiple_choice_questions.find(params[:quiz_id])

    @long_text_questions = @quiz.long_text_questions
    # @long_text_question =  @quiz.long_text_questions.find(params[:quiz_id])

    @short_text_questions = @quiz.short_text_questions
    # @short_text_question =  @quiz.short_text_questions.find(params[:quiz_id])

  end

  # GET /quizzes/new
  def new

    @multiple_choice_question = @quiz.multiple_choice_questions.new
    @single_choice_question = @quiz.single_choice_questions.new
    @short_text_question = @quiz.short_text_questions.new
    @long_text_question = @quiz.long_text_questions.new
    @quiz = current_user.quizzes.new


    @question_option_multi = @multiple_choice_question.question_options.new
    @question_option_single = @single_choice_question.question_options.new

    @question_options = @question_option_multi && @question_option_single

  end

  # GET /quizzes/1/edit
  def edit
    @quiz = Quiz.find(params[:id])
  end

  def update
  @quiz = Quiz.find(params[:id])

  if @quiz.update(quiz_params)
    redirect_to @quiz
  else
    render :edit, status: :unprocessable_entity
  end
end

  def create
    @quiz = current_user.quizzes.new(quiz_params)

    respond_to do |format|
      if @quiz.save
        format.html { redirect_to quiz_url(@quiz), notice: "Quiz was successfully created." }
        format.json { render :show, status: :created, location: @quiz }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizzes/1 or /quizzes/1.json
def update
  respond_to do |format|
    if @quiz.update(quiz_params)
      format.html { redirect_to quiz_url(@quiz), notice: "Quiz was successfully updated." }
      format.json { render :show, status: :ok, location: @quiz }
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @quiz.errors, status: :unprocessable_entity }
    end
  end
end

# DELETE /quizzes/1 or /quizzes/1.json
def destroy
  @quiz.destroy

     respond_to do |format|
       format.html { redirect_to quizzes_url, notice: "Quiz was successfully destroyed." }
       format.json { head :no_content }
     end
end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_quiz
    @quiz = Quiz.find(params[:id])
  end

  # def single_choice_questions_params
  #   params.require(:single_choice_questions).permit(:title, :body, :quiz_id)
  # end
  # Only allow a list of trusted parameters through.
  def quiz_params
    params.require(:quiz).permit(:title, :description, :requested_time, multiple_choice_questions_attributes: [:id, :body, :type, :quiz_id], single_choice_questions_attributes: [:id, :body, :type, :quiz_id], long_text_questions_attributes: [:id, :body, :type, :quiz_id], short_text_questions_attributes: [:id, :body, :type, :quiz_id])
  end
end
