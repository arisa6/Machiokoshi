class Order < ApplicationRecord
    has_many :items,through: :order_detail
    has_many :order_details
    has_many :order_items
    belongs_to :customer
    
    validates :postal_code,presence: true
    validates :name,presence: true
    validates :address,presence: true
    
    enum status: { waiting_payment: 0, payment_confirmation: 1, under_prodction: 2, preparing_ship: 3, sent: 4 }
    enum payment_method: { credit_card: 0, transfer: 1 }
    
    def subtotal  #小計を求めるコマンド
        item.with_tax_price * amount
    end
end