class PrivateMessage < ApplicationRecord
    belongs_to :sender, class_name: "User"
    has_many :message_receivers
    has_many :recipients, class_name: "User", through: :message_receivers, source: :user
end
