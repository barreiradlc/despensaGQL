class Types::DespensaType < Types::BaseObject

    field :id, ID, null: true
    field :nome, String, null: true
    field :descricao, String, null: true
    field :items, [Types::ItemType], null: true

end
