class Types::ReceitaInputType < Types::BaseInputObject

    argument :id, ID, required: false
    argument :nome, String, required: false
    argument :descricao, String, required: false
    argument :ingredientes, [Types::IngredienteInputType], required: false
    argument :passos, [Types::PassoInputType], required: false

    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false

  end

