module Mutations
    class UpdateReceitaMutation < Mutations::BaseMutation
      
      argument :attributes, Types::ReceitaInputType, required: true
      argument :id, ID, required: true

      field :receitum, Types::ReceitaType, null: true
      field :errors, Types::ValidationErrorsType, null: true
      
      def resolve(id:, attributes:)
        check_authentication!
        
        user = User.find(context[:current_user].id)
        # user = User.find(1)
        
          
        @receita = Receitum.find(id)
            
        @receita.nome = attributes.nome
        @receita.descricao = attributes.descricao
        # provimentos: @provimento
    
        
        ingredientes = []
        passos = []
        
        
        if attributes.ingredientes.count > 0
            
            attributes.ingredientes.each do |i|
            
            @provimento = createOrFindProvimento(i)
            
            @receita.ingredientes << createIngrediente(i, @provimento, @receita)
            
            end
            
        end
        
        if attributes.passos.count > 0
            
            attributes.passos.each do |i|
        
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