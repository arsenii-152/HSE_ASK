class Quiz < ApplicationRecord
  belongs_to :user
  has_many :questions
  has_many :short_text_questions
  has_many :long_text_questions
  has_many :single_choice_questions
  has_many :multiple_choice_questions

  accepts_nested_attributes_for :multiple_choice_questions, :single_choice_questions, :long_text_questions, :short_text_questions

end
