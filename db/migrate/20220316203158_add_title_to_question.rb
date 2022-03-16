class AddTitleToQuestion < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :title, :text
  end
end
