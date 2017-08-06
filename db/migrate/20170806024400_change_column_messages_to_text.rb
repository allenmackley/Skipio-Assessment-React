class ChangeColumnMessagesToText < ActiveRecord::Migration[5.1]
  def change
    rename_column :messages, :message, :text
  end
end
