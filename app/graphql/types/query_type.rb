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

    field :receita, Types::ReceitaType ,null: true do
      argument :id, ID, required: true
    end

    def receita(id:)
      Receitum.find(id)
    end    

    field :receitas, [Types::ReceitaType],null: true do
      argument :query, String, required: false
    end

    def receitas
      q = Receitum.all
      # if query.present?
      #  q = Receitum.where("nome like ?", "%#{query}%")
      # end
    end    


end
