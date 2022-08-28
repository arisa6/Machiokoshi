class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy
  # has_many :favorites,dependent: :destroy
  has_many :items, dependent: :destroy
  
  # 退会機能
  def active_for_authentication?
    super && (is_deleted == false)
  end
  
  
  # いいねをしたかしていないかの判定メソッド
  # def already_favorited?(item)
  #   self.favorites.exists?(item_id: item.id) #以前にitem_idがテーブルに保存されているかを調べる
  # end

  
  
end
