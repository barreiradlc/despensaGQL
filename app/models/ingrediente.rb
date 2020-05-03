class Ingrediente < ApplicationRecord

    belongs_to :provimento
    belongs_to :receitum

    # accepts_nested_attributes_for :provimento
end
