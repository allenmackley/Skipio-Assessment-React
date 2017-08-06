class ChangeColumnSkipioContactUserIdToString < ActiveRecord::Migration[5.1]
  def change
    change_column :messages, :skipio_contact_user_id, :string
  end
end
