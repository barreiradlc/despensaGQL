module Mutations
    class UpdatePerfilMutation < Mutations::BaseMutation
      
      argument :perfil, Types::CredentialsInputType, required: true

      field :user, Types::UserType, null: true
      field :errors, Types::ValidationErrorsType, null: true
      
        def resolve( perfil: )
            check_authentication!
            
            @user = User.find(context[:current_user].id)
            # @user = User.find(1)
            
            @user.update(perfil.to_h)
        
            if @user.save
                { user: @user }
            else
                { errors: @user.errors }
            end

        end
      end
    end