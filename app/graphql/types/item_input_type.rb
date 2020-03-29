module Types
    class ItemInputType < Types::BaseInputObject
        description "Attributes for creating or updating an item"
        
        argument :id, ID, required: false
        argument :title, String, required: false
        argument :description, String, required: false
        argument :image_url, String, required: false
    end
end