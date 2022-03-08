class User < ApplicationRecord
  has_many :quizzes
  has_many :answers
  has_many :questions,
  :through => :quizzes
end
