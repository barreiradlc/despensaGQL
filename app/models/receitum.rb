class Receitum < ApplicationRecord
    
    belongs_to :user
    has_many :ingredientes, :dependent => :destroy
    has_many :passos, :dependent => :destroy

    # accepts_nested_attributes_for :ingredientes, allow_destroy: true
end
