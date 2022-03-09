class AddGroupToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :group, :text
  end
end
