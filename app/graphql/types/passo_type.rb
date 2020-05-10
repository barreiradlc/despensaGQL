class Types::PassoType < Types::BaseObject
    description "Attributes for creating or updating an passo"
    
    field :id, ID, null: false

    field :descricao, String, null: false
    field :posicao, Integer, null: false

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

end