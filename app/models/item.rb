class Item < ApplicationRecord
  belongs_to :user
  
  belongs_to :provimento
  belongs_to :despensa

  accepts_nested_attributes_for :provimento

end
