class AddTypeToAnswer < ActiveRecord::Migration[6.1]
  def change
    add_column :answers, :type, :integer
  end
end
