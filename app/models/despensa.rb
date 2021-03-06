class Despensa < ApplicationRecord

    has_and_belongs_to_many :users

    has_many :items, :dependent => :destroy

    
    accepts_nested_attributes_for :items, allow_destroy: true
    
end
