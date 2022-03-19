class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.integer :quiz_id
      t.text :title
      t.string :type
      t.text :body

      t.timestamps
    end
  end
end
