class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :answerable, polymorphic: true
  has_many :answer_options
end
