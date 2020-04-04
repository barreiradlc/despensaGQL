module Mutations
    class AddDespensaMutation < Mutations::BaseMutation
      
      argument :attributes, Types::DespensaInputType, required: true
      
      field :despensa, Types::DespensaType, null: true
      field :errors, Types::ValidationErrorsType, null: true
      
      def resolve(attributes:)
        check_authentication!

        jon = User.find(1)
  
        despensa = Despensa.new({
          nome: attributes.nome,
          descricao: attributes.descricao,
          # users: [ context[:current_user] ],
          users: [ jon ]
        })
        
        items = []

        if attributes.items.count > 0
          attributes.items.each do |i|
              
              @provimento = createOrFindProvimento(i)
              
              items << createItem(i, @provimento, despensa, jon)
              
          end
        end   

        if despensa.save            
          { despensa: despensa }
        else
          { errors: despensa.errors }
        end
  
      end

      def createItem(item, provimento, despensa, jon)

        Item.create!({
          
          provimento: provimento,
          despensa: despensa,
          user: jon,
          
          validade: Time.now + 300.hours.to_i,
          quantidade: item.quantidade,

          created_at: Time.now,
          updated_at: Time.now
        })
      end 

      def createOrFindProvimento(item)
        
        @provimento = Provimento.where(nome: item.provimento.nome)[0]
          if !@provimento
              Provimento.create(nome: item.provimento.nome)
          end
        @provimento

      end

    end
  end