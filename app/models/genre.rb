class Genre < ApplicationRecord
    has_many :items
    has_many :favorites,dependent: :destroy
end
