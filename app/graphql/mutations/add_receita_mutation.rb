module Mutations
    class AddReceitaMutation < Mutations::BaseMutation
  
      argument :attributes, Types::ReceitaInputType, required: true
  
      field :receitum, Types::ReceitaType, null: true
      field :errors, Types::ValidationErrorsType, null: true
  
      def resolve(attributes:)
        check_authentication!
  
        # user = User.find(context[:current_user].id)
        user = User.find(1)

        
        receita = Receitum.new({
          # attributes.to_h.merge(user: user)
          nome: attributes.nome,
          user: user,
          descricao: attributes.descricao,
          # provimentos: @provimento
          })

          ingredientes = []
        
        if attributes.ingredientes.count > 0
            
            attributes.ingredientes.each do |i|

                @provimento = createOrFindProvimento(i)

                ingredientes << createIngrediente(i, @provimento, receita, user)
              
            end
            
        end
        
        puts @provimento.to_json
  
        puts receita.to_json
  
        if receita.save
        #   GqlDespensaSchema.subscriptions.trigger("itemAdded", {}, item)
          { receitum: receita }
        else
          { errors: receita.errors }
        end
  
      end

      def createIngrediente(ingrediente, provimento, receita, user)

        puts receita.to_json

        Ingrediente.create!({
          
          provimento: provimento,
          receitum: receita,
          
          quantidade: ingrediente.quantidade,

          created_at: Time.now,
          updated_at: Time.now
        })
      end 

      def createOrFindProvimento(ingrediente)
        
        @provimento = Provimento.where(nome: ingrediente.provimento.nome)[0]
          if !@provimento
            @provimento = Provimento.create(nome: ingrediente.provimento.nome)
          end
        @provimento

      end

    end
  end