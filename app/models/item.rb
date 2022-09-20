class Item < ApplicationRecord
    has_one_attached :image
    belongs_to :genre
    belongs_to :customer
    # has_many :favorites,dependent: :destroy　実装予定
    has_many :cart_items,dependent: :destroy
    has_many :order_details,dependent: :destroy
    
    
    # validates :image,presence:true
    validates :genre_id, presence: true  #空でないこと
    validates :name,presence:true
    validates :introduction,presence:true
    validates :genre,presence:true
    # validates :add_tax_price,presence:true
    validates :is_active, inclusion: { in: [true, false] }
    
    def get_image
        (image.attached?) ? image : 'no_image.jpg'
    end
    
    
    ## 消費税を求めるメソッド
    def with_tax_price
        (price * 1.1).floor
    end
        
    def favorited_by?(customer)  #customer_idがFavoritesテーブル内に存在（exists?）するかどうかを判断
      favorites.exists?(customer_id: customer.id)  #以前にcustomer_idがテーブルに保存されているかを調べる
    end

    
    def subtotal  #小計を求めるコマンド
        item.with_tax_price * amount
    end
end
