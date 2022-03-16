class RemoveBodyFromQuestion < ActiveRecord::Migration[6.1]
  def change
    remove_column :questions, :body, :text
  end
end
