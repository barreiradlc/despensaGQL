module Types
    class ItemInputType < Types::BaseInputObject
        description "Attributes for creating or updating an item"
        
        argument :id, ID, required: false
        # argument :quantidade, Integer, required: false
        # argument :validade, Types::DateTime, required: false

        # argument :created_at, Types::DateTime, required: false
        # argument :updated_at, Types::DateTime, required: false

        # argument :despensa_id, Integer, required: true
        # argument :provimento_id, Integer, required: true
        # argument :user_id, Integer, required: true
    end
end