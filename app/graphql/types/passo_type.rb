class Types::PassoType < Types::BaseObject
    description "Attributes for creating or updating an passo"
    
    field :id, ID, null: true

    field :descricao, String, null: true
    field :posicao, Integer, null: true

    field :created_at, GraphQL::Types::ISO8601DateTime, null: true
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: true

end