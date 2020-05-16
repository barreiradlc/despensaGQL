class Types::ConviteInputType < Types::BaseInputObject

    argument :id, ID, required: false
    argument :mensagem, String, required: false
    argument :despensa_id, Integer, required: false

    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false

end