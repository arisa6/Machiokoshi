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
  
  validates :last_name,presence: true
  validates :first_name,presence: true
  validates :last_name_kana,presence: true
  validates :first_name_kana,presence: true
  validates :postal_code,presence: true
  validates :address,presence: true
  validates :phone_number,presence: true
  validates :email,presence: true
  validates :password,presence: true
  

  # 退会機能
  def active_for_authentication?
    super && (is_deleted == false)
  end
  
  
  def name
    [first_name, last_name].join(' ')
  end
  # def full_name
  #   self.last_name + " " + self.first_name
  # end
  
  
  # いいねをしたかしていないかの判定メソッド
  # def already_favorited?(item)
  #   self.favorites.exists?(item_id: item.id) #以前にitem_idがテーブルに保存されているかを調べる
  # end

  
  
end
