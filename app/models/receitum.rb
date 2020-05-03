class Receitum < ApplicationRecord
    
    belongs_to :user
    has_many :ingredientes, :dependent => :destroy

    accepts_nested_attributes_for :ingredientes, allow_destroy: true
end
