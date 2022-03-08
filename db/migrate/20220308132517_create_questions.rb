class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.text :question
      t.text :body
      t.integer :user_id
      t.integer :quiz_id

      t.timestamps
    end
  end
end
