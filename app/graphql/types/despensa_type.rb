class Types::DespensaType < Types::BaseObject

    field :id, ID, null: true
    field :uuid, String, null: true
    field :nome, String, null: true
    field :descricao, String, null: true

    field :items, [Types::ItemType], null: true
    field :users, [Types::UserType], null: true

end
