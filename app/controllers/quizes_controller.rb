class QuizesController < ApplicationController
  def index
    @quizes = Quiz.all
  end
end
