class Types::ReceitaType < Types::BaseObject

    field :id, ID, null: true
    field :nome, String, null: true
    field :descricao, String, null: true
    
    field :ingredientes, [Types::IngredienteType], null: true
    field :passos, [Types::PassoType], null: true

    field :created_at, GraphQL::Types::ISO8601DateTime, null: true
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: true

  end

