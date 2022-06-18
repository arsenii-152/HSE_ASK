class Api::V1::QuizzesController < Api::V1::ApplicationController


  # GET /quizzes or /quizzes.json
  def index
    @quizzes = Quiz.all

    render json: { quizzes: @quizzes }

  end

  # GET /quizzes/1 or /quizzes/1.json
  def show
    @quiz = Quiz.find(params[:id])
    @all_questions = @quiz.questions
    @question_options = QuestionOption.all
    @multiple_choice_question = @quiz.multiple_choice_questions
    @single_choice_question = @quiz.single_choice_questions


    render json: { quiz: @quiz, questions: @quiz.questions }
  end

  # GET /quizzes/new
  def new
    @quiz = current_user.quizzes.build

    @multiple_choice_question = @quiz.multiple_choice_questions.build
    @single_choice_question = @quiz.single_choice_questions.build
    @short_text_question = @quiz.short_text_questions.build
    @long_text_question = @quiz.long_text_questions.build


    @question_option_multi = @multiple_choice_question.question_options.build
    @question_option_single = @single_choice_question.question_options.build

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
    @quiz = current_user.quizzes.create(quiz_params)
    @multiple_choice_question = @quiz.multiple_choice_questions.create
    @single_choice_question = @quiz.single_choice_questions.create
    @short_text_question = @quiz.short_text_questions.create
    @long_text_question = @quiz.long_text_questions.create

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

  # Only allow a list of trusted parameters through.
  def quiz_params
    params.require(:quiz).permit(:title, :description, :requested_time, multiple_choice_questions_attributes: [:id, :body, :type, :quiz_id], single_choice_questions_attributes: [:id, :body, :type, :quiz_id], long_text_questions_attributes: [:id, :body, :type, :quiz_id], short_text_questions_attributes: [:id, :body, :type, :quiz_id])
  end
end
