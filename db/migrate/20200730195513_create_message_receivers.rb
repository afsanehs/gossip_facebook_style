class CreateMessageReceivers < ActiveRecord::Migration[6.0]
  def change
    create_table :message_receivers do |t|
      t.integer :private_message_id
      t.integer :user_id

      t.timestamps
    end
  end
end
