class TextAnswersController < ApplicationController
  def index
    @text_answers = TextAnswer.all
  end
end
