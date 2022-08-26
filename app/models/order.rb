class Order < ApplicationRecord
    has_many :items,through: :order_detail
    has_many :order_details
    has_many :order_items
    belongs_to :customer
    enum order_status: { "入金待ち": 0, "入金確認": 1, "製作中": 2, "発送準備中": 3, "発送済み": 4 }
    enum payment_method: { credit_card: 0, transfer: 1 }
    
    def subtotal  #小計を求めるコマンド
        item.add_tax_price * amount
    end
end