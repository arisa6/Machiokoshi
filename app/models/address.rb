class Address < ApplicationRecord
    belongs_to :customer
    
    validates :postal_code,presence: true
    validates :name,presence: true
    validates :address,presence: true
    
    def address_for_view
        self.postal_code + "　" + self.address + "　" + self.name
    end
end
