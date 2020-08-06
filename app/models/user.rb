class User < ApplicationRecord
    belongs_to :city, required: false
    has_many :gossips

    has_many :sent_private_messages, class_name: "PrivateMessage", foreign_key: 'sender_id'

    has_many :message_receivers
    has_many :received_private_messages, class_name: "PrivateMessage", through: :message_receivers

    has_many :likes, dependent: :destroy

    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
end
