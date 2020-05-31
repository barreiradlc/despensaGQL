module Mutations
    class AddConviteMutation < Mutations::BaseMutation
      
      argument :convite, Types::ConviteInputType, required: true
      argument :id, Integer, required: true
      
      field :convite, Types::ConviteType, null: true
      field :errors, Types::ValidationErrorsType, null: true
      
      def resolve(convite:, id:)
        check_authentication!
        
        # usuario_solicitacao = User.find(1)
        usuario_solicitacao = User.find(context[:current_user].id)
        # user = User.find(id)
    
        @convite = Convite.new(convite.to_h.merge(user: user, usuario_solicitacao: usuario_solicitacao['id']))
    
          if @convite.save
          #   GqlDespensaSchema.subscriptions.trigger("itemAdded", {}, item)
            { convite: @convite }
          else
            { errors: @convite.errors }
          end
        
      end
    end
end