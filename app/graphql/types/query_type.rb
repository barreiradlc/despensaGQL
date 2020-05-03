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

    field :users, [Types::UserType],null: true do
      argument :query, String, required: true
    end

    def users(query:)
      User.where("username like ?", "%#{query}%")
    end    
    
    field :provimentos, [Types::ProvimentoType],null: true do
      argument :query, String, required: true
    end

    def provimentos(query:)
      Provimento.where("nome like ?", "%#{query}%")
    end    

end
