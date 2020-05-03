class Receitum < ApplicationRecord
    attr_accessible :provimentos
    
    belongs_to :user
    has_many :provimentos

    accepts_nested_attributes_for :provimentos
end
