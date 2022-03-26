class CreateAnswerOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :answer_options do |t|
      t.integer :question_option_id
      t.integer :user_id
      t.integer :answer_id

      t.timestamps
    end
  end
end
