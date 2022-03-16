class RemoveQuestionFromQuestion < ActiveRecord::Migration[6.1]
  def change
    remove_column :questions, :question, :text
  end
end
