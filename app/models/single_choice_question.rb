class SingleChoiceQuestion < Question
  has_many :question_options, as: :question_optionable
end
