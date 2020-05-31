module Mutations
    class ResponseConviteMutation < Mutations::BaseMutation
      
      argument :aceita, Boolean, required: true
      argument :id, Integer, required: false
      
      field :response, Types::DespensaType, null: true
      field :errors, Types::ValidationErrorsType, null: true
      
      def resolve(aceita:, id:)

        check_authentication!
        
        # user = User.find(2)
        user = User.find(context[:current_user].id)
        # @convite = Convite.find(id)

        if aceita
            @despensa = Despensa.find(@convite.despensa_id)

            @despensa.users << user

            if @despensa.save && @convite.destroy
            #   GqlDespensaSchema.subscriptions.trigger("itemAdded", {}, item)
                { response: @despensa }
            else
                { errors: @despensa.errors }
            end
        else
            if @convite.destroy
                { response: nil }
            else
                { errors: @convite.errors }
            end
        end
     
      end
    end
end