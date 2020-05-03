class Types::ReceitaInputType < Types::BaseInputObject

    argument :nome, String, required: false
    argument :descricao, String, required: false
    argument :provimentos, [Types::ProvimentoInputType], required: false

    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false

  end

