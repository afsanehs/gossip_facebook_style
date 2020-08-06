class CreatePrivateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :private_messages do |t|
      t.text :content
      t.integer :sender_id
      # t.integer :receiver_id
      #t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
