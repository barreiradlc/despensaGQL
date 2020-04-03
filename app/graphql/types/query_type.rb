class Types:: QueryType < Types::BaseObject
    
    field :items, [Types::ItemType], null: false, description: "Itens"

    def items
      Item.all
    end
    
    field :despensas, [Types::DespensaType], null: false, description: "despensas"

    def despensas
      Despensa.all
    end

    field :me, Types::UserType, null: true

    def me
      context[:current_user]
    end

end
