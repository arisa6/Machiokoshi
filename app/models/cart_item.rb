class CartItem < ApplicationRecord
    belongs_to :item
    belongs_to :customer
    
    validates :item_id,presence: true
    validates :amount,presence: true
    
    def subtotal  #小計を求めるコマンド
        item.with_tax_price * amount
    end
end
