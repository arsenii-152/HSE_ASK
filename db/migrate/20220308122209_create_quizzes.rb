class CreateQuizzes < ActiveRecord::Migration[6.1]
  def change
    create_table :quizzes do |t|
      t.string :title
      t.text :description
      t.integer :requested_time
      t.integer :user_id
      t.integer :question_id

      t.timestamps
    end
  end
end
