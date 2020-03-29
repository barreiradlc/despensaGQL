module Types
  class ItemType < Types::BaseObject
    field :id, ID, null: true
    field :title, String, null: true
    field :description, String, null: true
    field :image_url, String, null: true
  end
end

