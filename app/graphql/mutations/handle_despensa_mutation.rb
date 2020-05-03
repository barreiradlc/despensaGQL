module Mutations
    class HandleDespensaMutation < Mutations::BaseMutation
      
      argument :despensas, [Types::DespensaInputType], required: true      
      
      field :despensa, [Types::DespensaType], null: true
      field :errors, Types::ValidationErrorsType, null: true
      
      def resolve(args)

        despensas = args[:despensas]

        check_authentication!

        puts 'user'
        
        puts 'user'

        # user = User.find(context[:current_user].id)
        user = User.find(1)
        
        @listDespensas = despensas.each do |attributes|
            saveOrCreate(attributes)
        end

        def saveOrCreate(attributes)

        if attributes.id.present?
            @despensa = Despensa.find(attributes.id)
        else
            @despensa = Despensa.new({
                nome: attributes.nome,
                descricao: attributes.descricao,
                # users: [ context[:current_user] ],
                users: [ user ]
            })
        end    

        items = []
        if attributes.items
            
            attributes.items.each do |i|
              
                @provimento = createOrFindProvimento(i)
                
                items << createItem(i, @provimento, @despensa, user)
                
            end

        end

        # @despensa.items_attributes.update(attributes.items.to_h)

        if @despensa.update({
                nome: attributes.nome,
                descricao: attributes.descricao,
                items: items
            })
        # if @despensa.update(despensa_attr)
          @listDespensas << @despensa.to_unsafe_h
        else
          { errors: @despensa.errors }
        end
  
      end
      
      def createItem(item, provimento, despensa, user)
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
          user: user,
          
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

    {despensa: @listDespensas}

    end
  end