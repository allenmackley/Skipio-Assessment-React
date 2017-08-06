class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :skipio_contact_user_id
      t.text :message

      t.timestamps
    end
  end
end
