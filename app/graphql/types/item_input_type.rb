module Types
    class ItemInputType < Types::BaseInputObject
        description "Attributes for creating or updating an item"
        
        argument :id, ID, required: false
        argument :quantidade, Integer, required: false
        argument :validade, GraphQL::Types::ISO8601DateTime, required: false

        argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
        argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false

        argument :provimento, Types::ProvimentoInputType, required: true

    end
end