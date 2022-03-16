class TextAnswer < Answer
  belongs_to :text_question
  belongs_to :user
end
