class AnswerOption < ApplicationRecord
  belongs_to :question_option
  belongs_to :user
  belongs_to :answer
end
