class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @quizes = Quiz.all
  end
end
