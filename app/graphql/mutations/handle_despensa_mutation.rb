module Mutations
    class HandleDespensaMutation < Mutations::BaseMutation
      
      argument :despensas, [Types::DespensaInputType], required: true      
      
      field :despensas, [Types::DespensaType], null: true
      field :errors, Types::ValidationErrorsType, null: true
       
      def resolve(args)

        despensas = args[:despensas]

        check_authentication!

        puts 'user'
        
        puts 'user'

        @user = User.find(context[:current_user].id)
        # @user = User.find(1)
        
        @listDespensas = []
        
        despensas.each do |attributes|
            saveOrCreate(attributes, @user)
        end

        
           {despensas: @listDespensas}
        
      
      end

      def createOrFindProvimento(item)
          
       puts 'Despensas a salvar'
        puts @listDespensas.to_json
        puts 'Despensas a salvar'

        if item.provimento.id
          return Provimento.find(item.provimento.id)
        end      
        puts item.provimento

        @provimento = Provimento.where(nome: item.provimento.nome)[0]
          puts item.to_json

          if !@provimento
            @provimento  = Provimento.create!(nome: item.provimento.nome)
          else
            @provimento.update(item.provimento.to_h)
          end

          @provimento
      end


      def createItem(item, provimento, despensa, user)

        if item.id.present?
            @item_atual = Item.find(item.id)

            if item.deleted_at.present?
              if @item_atual
                @item_atual.destroy
                return
              end
              return
            else
              @item_atual.update!({
                quantidade: item.quantidade,
                validade: item.validade,
              })
  
              if @item_atual.provimento.id == provimento.id
                @item_atual
              else
                @item_atual.update!(provimento: item.provimento.to_h)
              end
              
            end
            
            
          else
            if item.deleted_at.present?              
              return
            end

            Item.create!({
              
                provimento: provimento,
                despensa: despensa,
                user: user,
                
                validade: item.validade && item.validade,
                quantidade: item.quantidade,
                uuid: item.uuid,
    
                created_at: Time.now,
                updated_at: Time.now
              })
              
        end
      end
      

      def saveOrCreate(attributes, user)

        if attributes.id.present?
          @despensa = Despensa.find(attributes.id)
          if attributes.deleted_at.present?
            @despensa.destroy
            return []
          end
        else
            @despensa = Despensa.new({
                uuid: attributes.uuid,
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
        if @despensa.id.present?

          if @despensa.update({
                  nome: attributes.nome,
                  descricao: attributes.descricao,
                  # items: items
              })
          
            @listDespensas << @despensa
          else
            { errors: @despensa.errors }
          end

        else
            
          if @despensa.save!({
                    nome: attributes.nome,
                    descricao: attributes.descricao,
                    items: items
                })
              @listDespensas << @despensa
            else
              { errors: @despensa.errors }
            end
            
          
        end
        
        # @despensa.items = items

      end
    

    

    end
  end