module Mutations
    class AddReceitaMutation < Mutations::BaseMutation
  
      argument :attributes, Types::ReceitaInputType, required: true
  
      field :receita, Types::ReceitaType, null: true
      field :errors, Types::ValidationErrorsType, null: true
  
      def resolve(attributes:)
        check_authentication!
  
        # user = User.find(context[:current_user].id)
        user = User.find(1)

        receita = Receitum.new(attributes.to_h.merge(user: user)
            # nome: attributes.nome,
            # descricao: attributes.descricao,
            # user: user
        )

        # if attributes.provimentos.count > 0
            
        #     attributes.provimentos.each do |i|

        #         @provimento = createOrFindProvimento(i)
              
        #     end
            
        # end
  
        puts receita
  
        if receita.save
        #   GqlDespensaSchema.subscriptions.trigger("itemAdded", {}, item)
          { receita: receita }
        else
          { errors: receita.errors }
        end
  
      end

      def createOrFindProvimento(item)
        
        @provimento = Provimento.where(nome: item.nome)[0]
          if !@provimento
              Provimento.create(nome: item.nome)
          end
        @provimento

      end

    end
  end