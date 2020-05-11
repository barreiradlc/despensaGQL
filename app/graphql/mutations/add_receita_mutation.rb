module Mutations
  class AddReceitaMutation < Mutations::BaseMutation
    
    argument :receita, Types::ReceitaInputType, required: true
    
    field :receitum, Types::ReceitaType, null: true
    field :errors, Types::ValidationErrorsType, null: true
    
    def resolve(receita:)
      check_authentication!
      
      user = User.find(context[:current_user].id)
      # user = User.find(1)
      
        
      @receita = Receitum.new({
          # receita.to_h.merge(user: user)
          nome: receita.nome,
          user: user,
          descricao: receita.descricao,
          # provimentos: @provimento
          })
          
          ingredientes = []
          passos = []
          
          
          if receita.ingredientes.count > 0
            
            receita.ingredientes.each do |i|
              
              @provimento = createOrFindProvimento(i)
              
              @receita.ingredientes << createIngrediente(i, @provimento, @receita)
              
            end
            
          end
          
          if receita.passos.count > 0
              
              receita.passos.each do |i|
          
                  @receita.passos << createOrFindPasso(i, @receita)
                
              end              
          end
        
        puts @provimento.to_json
  
        puts @receita.to_json
  
        if @receita.save
        #   GqlDespensaSchema.subscriptions.trigger("itemAdded", {}, item)
          { receitum: @receita }
        else
          { errors: @receita.errors }
        end
  
      end

      def createIngrediente(ingrediente, provimento, receita)

        puts receita.to_json

        Ingrediente.create({
          
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
      
      
      def createOrFindPasso(passo, receita)
        


        if passo.id.present?
          @passo = Passo.find(passo)

          @passo = passo

          @passo.save
        else
          @passo = Passo.create!(passo.to_h.merge(receitum: receita))
        end
        
        @passo

      end

    end
  end