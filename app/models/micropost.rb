class Micropost < ApplicationRecord
    belongs_to :user
    default_scope -> { order('created_at DESC')}
    validates :content, presence: true, length: { maximum: 240 }
    validates :user_id, presence: true
    has_many :likes, dependent: :destroy
end
