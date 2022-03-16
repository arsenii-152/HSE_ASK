class AddTypeToQuestion < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :type, :string
  end
end
