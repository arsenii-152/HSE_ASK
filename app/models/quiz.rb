class Quiz < ApplicationRecord
  belongs_to :user
  has_many :questions
  has_many :text_questions
end
