class Favorite < ApplicationRecord
    belongs_to :genre
    belongs_to :customer
    belongs_to :item
    
    # 1人ができるいいね数は1つまで
    validates_uniqueness_of :item_id, scope: :customer_id
end
