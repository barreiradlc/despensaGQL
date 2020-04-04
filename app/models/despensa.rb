class Despensa < ApplicationRecord

    has_many :items, :dependent => :destroy

    accepts_nested_attributes_for :items, allow_destroy: true
    
    has_and_belongs_to_many :users

end
