module Mutations
    class UpdatePerfilMutation < Mutations::BaseMutation
      
      argument :perfil, Types::CredentialsInputType, required: true

      field :user, Types::UserType, null: true
      field :errors, Types::ValidationErrorsType, null: true
      
        def resolve(id:, perfil:)
            check_authentication!
            
            @user = User.find(context[:current_user].id)
            # user = User.find(1)
            
            @perfil.update(perfil.to_h)
        
            if @perfil.save
                { receitum: @receita }
            else
                { errors: @receita.errors }
            end

        end
      end
    end