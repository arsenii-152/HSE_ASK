class AddTextResponseToAnswer < ActiveRecord::Migration[6.1]
  def change
    add_column :answers, :text_response, :text
  end
end
