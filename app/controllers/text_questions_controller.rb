class TextQuestionsController < ApplicationController
  def index
    @text_questions = TextQuestion.all
  end
end
