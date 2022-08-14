class Item < ApplicationRecord
    # validates :genre_id, presence: true  #空でないこと
    belongs_to :genre
    has_many :cart_items,dependent: :destroy
    has_many :order_details,dependent: :destroy
    
    attachment :image
    
end
