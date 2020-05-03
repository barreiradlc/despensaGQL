class Types::ReceitaType < Types::BaseObject

    field :nome, String, null: true
    field :descricao, String, null: true
    field :ingredientes, [Types::IngredienteType], null: true

    field :created_at, GraphQL::Types::ISO8601DateTime, null: true
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: true

  end

