class CreateQuestionOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :question_options do |t|
      t.text :body
      t.integer :question_optionable_id
      t.string :question_optionable_type

      t.timestamps
    end
  end
end
