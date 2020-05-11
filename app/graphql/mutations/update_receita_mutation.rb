module Mutations
    class UpdateReceitaMutation < Mutations::BaseMutation
      
      argument :receita, Types::ReceitaInputType, required: true
      argument :id, ID, required: true

      field :receitum, Types::ReceitaType, null: true
      field :errors, Types::ValidationErrorsType, null: true
      
      def resolve(id:, receita:)
        check_authentication!
        
        user = User.find(context[:current_user].id)
        # user = User.find(1)
        
          
        @receita = Receitum.find(id)
            
        @receita.nome = receita.nome
        @receita.descricao = receita.descricao
        # provimentos: @provimento
    
        
        ingredientes = []
        passos = []
        
        if receita.ingredientes.count > 0
            
            receita.ingredientes.each do |i|
            
            @provimento = createOrFindProvimento(i)
            
            @receita.ingredientes << createIngrediente(i, @provimento, @receita)
            
            end
            
        end
        
        if receita.passos.count > 0
            
            receita.passos.each do |i, index|
        
                @receita.passos << createOrFindPasso(i, @receita, index)
                
            end              
        end
        
        puts @provimento.to_json

        puts @receita.to_json

        if @receita.save
            { receitum: @receita }
        else
            { errors: @receita.errors }
        end

    end

    def createIngrediente(ingrediente, provimento, receita)

        if ingrediente.id.present?
            @ingrediente_atual = Ingrediente.find(ingrediente.id)
            
            if @ingrediente_atual.provimento.id == provimento.id
              @ingrediente_atual
            else
              @ingrediente_atual.update(provimento: provimento)
            end
            @ingrediente_atual 
        else

        puts receita.to_json

        Ingrediente.create({
        
        provimento: provimento,
        receitum: receita,
        
        quantidade: ingrediente.quantidade,

        created_at: Time.now,
        updated_at: Time.now
        })

        end 
    end 

    def createOrFindProvimento(ingrediente)
        
        @provimento = Provimento.where(nome: ingrediente.provimento.nome)[0]

        if !@provimento
            @provimento = Provimento.create(nome: ingrediente.provimento.nome)
        end

        @provimento

    end
    
    def createOrFindPasso(passo, receita, index)
        
        if passo.id.present?
            @passo = Passo.find(passo.id)

            # @passo.descricao = passo.descricao
            # @passo.posicao = passo.posicao

            @passo.update({
                descricao: passo.descricao,
                posicao: passo.posicao || index + 1
            })
        else
            @passo = Passo.create!(passo.to_h.merge(receitum: receita))
        end
        
        @passo

    end
  
      end
    end