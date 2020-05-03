module Types
    class IngredienteInputType < Types::BaseInputObject
        description "Attributes for creating or updating an ingrediente"
        
        argument :id, ID, required: false
        argument :quantidade, Integer, required: false

        argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
        argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false

        argument :provimento, Types::ProvimentoInputType, required: true

    end
end