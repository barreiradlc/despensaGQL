module Mutations
    class AddProvimentoMutation < Mutations::BaseMutation
  
    #   argument :attributes, Types::ProvimentoInputType, required: true
  
    #   field :item, Types::ProvimentoType, null: true
      field :errors, Types::ValidationErrorsType, null: true
  
    def resolve(attributes:)
        check_authentication!
  
        provimento = Provimento.new(attributes)
  
        puts provimento
  
        if provimento.save
        #   GqlDespensaSchema.subscriptions.trigger("provimentoAdded", {}, provimento)
          { provimento: provimento }
        else
          { errors: provimento.errors }
        end
  
      end
    end
  end