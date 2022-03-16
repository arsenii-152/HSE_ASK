class AddFieldToQuestion < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :field, :text
  end
end
