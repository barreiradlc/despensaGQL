class Types::DespensaInputType < Types::BaseInputObject

    argument :id, ID, required: false
    argument :uuid, String, required: false
    argument :nome, String, required: false
    argument :descricao, String, required: false

    argument :items, [Types::ItemInputType], required: false
    # argument :users, [Types::UserType], required: false

end
