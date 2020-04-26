module Mutations
    class UpdateDespensaMutation < Mutations::BaseMutation
      
      argument :attributes, Types::DespensaInputType, required: true
      argument :id, ID, required: true
      
      field :despensa, Types::DespensaType, null: true
      field :errors, Types::ValidationErrorsType, null: true
      
      def resolve(id:, attributes:)
        check_authentication!

        puts 'user'
        
        puts 'user'

        jon = User.find(context[:current_user].id)
        
        @despensa = Despensa.find(id)

        items = []
        if attributes.items
            
            attributes.items.each do |i|
              
                @provimento = createOrFindProvimento(i)
                
                items << createItem(i, @provimento, @despensa, jon)
                
            end

        end

        # @despensa.items_attributes.update(attributes.items.to_h)

        if @despensa.update({
                nome: attributes.nome,
                descricao: attributes.descricao,
                items: items
            })
        # if @despensa.update(despensa_attr)
          { despensa: @despensa }
        else
          { errors: @despensa.errors }
        end
  
      end
      
      def createItem(item, provimento, despensa, jon)
        if item.id
            @item_atual = Item.find(item.id)
            if @item_atual.provimento.id == provimento.id
             return @item_atual
            end
            @item_atual.update(provimento: provimento)

        end

        Item.create!({
          
          provimento: provimento,
          despensa: despensa,
          user: jon,
          
          validade: item.validade && item.validade,
          quantidade: item.quantidade,

          created_at: Time.now,
          updated_at: Time.now
        })
      end 

      def createOrFindProvimento(item)
        
        if item.provimento.id
           return Provimento.find(item.provimento.id)
        end

        @provimento = Provimento.where(nome: item.provimento.nome)[0]
          puts item.to_json

          if !@provimento
            @provimento  = Provimento.create(nome: item.provimento.nome)
          end
        @provimento

      end


    end
  end