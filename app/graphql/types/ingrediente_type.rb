class Types::IngredienteType < Types::BaseObject
        description "Attributes for creating or updating an ingrediente"
        
        field :id, ID, null: true
        field :quantidade, Integer, null: true

        field :created_at, GraphQL::Types::ISO8601DateTime, null: true
        field :updated_at, GraphQL::Types::ISO8601DateTime, null: true

        field :provimento, Types::ProvimentoType, null: true

end