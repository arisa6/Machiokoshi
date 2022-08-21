class Item < ApplicationRecord
    validates :genre_id, presence: true  #空でないこと
    belongs_to :genre
    belongs_to :customer
    has_many :favorites,dependent: :destroy
    has_many :cart_items,dependent: :destroy
    has_many :order_details,dependent: :destroy
    
    has_one_attached :image
    
    # validates :image,presence:true
    validates :name,presence:true
    validates :introduction,presence:true
    validates :genre,presence:true
    validates :add_tax_price,presence:true
    validates :is_active, inclusion: { in: [true, false] }
    
    def get_image
    (image.attached?) ? image : 'no_image.jpg'
    end
  
    def add_tax_price
    (self.price * 1.10).round
    end
    
end
