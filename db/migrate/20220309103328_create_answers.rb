class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.text :body
      t.integer :user_id
      t.integer :answerable_id
      t.string :answerable_type

      t.timestamps
    end
  end
end
