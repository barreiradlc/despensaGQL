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
      puts query
      if query != ''
        User.where("username ILIKE ? or unaccent(first_name) ILIKE ? or email ILIKE ?", "%#{query}%","%#{query}%","%#{query}%")
      end    
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
      Receitum.all
    end

    field :receitas_possiveis, [Types::ReceitaType],null: true do
      argument :provimentos, [Integer], required: false
    end

    def receitas_possiveis(provimentos:)
      Receitum.joins(:ingredientes).merge(Ingrediente.joins(:provimento).where("provimento_id = ANY(ARRAY[?])", provimentos)).distinct.limit(10)
    end

end
