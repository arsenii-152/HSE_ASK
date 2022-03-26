class Question < ApplicationRecord
  belongs_to :quiz
  has_many :answers, as: :answerable

  # Type field to the Table

  # Text
  # Class TextQuestion
  # Field question_text

  # Multiple Choice Question
  # Class MultipleChoiceQuestion
  # has_many :question_options
  #
  # New model QuestionOption
  # - multiple_choice_question_id
  #
  # New model AnswerOption
  # - question_option_id
  # - question_id
  # - answer_id
  #
  # Собираем статистику по голосованию
  # Если мы найдём квиз, в нём найдём вопросы,
  # по каждому вопросу мы нашли ответы и сделали сумму
  #
  # Смотрим результат голосования отдельного пользователя
  # Если мы найдём квиз, в нём найдём вопросы,
  # найдём по ним все ответы сделанные определённым пользователем,
  # тогда мы сможем вывести вопросы (quiz.questions)
  # с вариантами ответа (multiple_choice_question.question_options)
  # и выделить выбранный ответ

  # Single Choice Question
  # Class SingleChoiceQuestion
  # Принцип такой же, как в множественном выборе
end
