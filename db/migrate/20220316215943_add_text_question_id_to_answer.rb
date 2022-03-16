class AddTextQuestionIdToAnswer < ActiveRecord::Migration[6.1]
  def change
    add_column :answers, :text_question_id, :integer
  end
end
