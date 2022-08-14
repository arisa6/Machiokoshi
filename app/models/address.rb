class Address < ApplicationRecord
    belongs_to :customer
    
    def address_for_view
        self.postal_code + "　" + self.address + "　" + self.name
    end
end
