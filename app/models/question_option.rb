class QuestionOption < ApplicationRecord
  belongs_to :question_optionable, polymorphic: true
end
