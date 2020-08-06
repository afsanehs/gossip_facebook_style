class Gossip < ApplicationRecord
    belongs_to :user
    belongs_to :city
    has_many :tags
    has_many :likes, dependent: :destroy
end
