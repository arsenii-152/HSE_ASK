class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :quizzes, dependent: :destroy
  has_many :answers
  has_many :text_answers
  has_many :questions,
  :through => :quizzes, :dependent => :destroy
  has_many :text_questions,
  :through => :quizzes



end
