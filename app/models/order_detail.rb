class OrderDetail < ApplicationRecord
    belongs_to :item
    belongs_to :order
    
    enum making_status: { work_wrong: 0, work_wait: 1, work_middle: 2, work_completion: 3 }

end
