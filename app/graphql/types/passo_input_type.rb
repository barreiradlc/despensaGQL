class Types:: PassoInputType < Types::BaseInputObject
    description "Attributes for creating or updating an passo"
    
    argument :id, ID, required: false

    argument :descricao, String, required: false
    argument :posicao, Integer, required: false

    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false

end
