class TextQuestion < Question
  belongs_to :quiz
  has_many :text_answers
end
