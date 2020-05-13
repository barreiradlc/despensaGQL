module Mutations
    class SignUpMutation < Mutations::BaseMutation
      
      argument :attributes, Types::CredentialsInputType, required: true

      field :token, String, null: true
      field :user, Types::UserType, null: true

      def resolve(attributes:)
        @user = User.new(attributes.to_h)

        if @user.save          
          { user: @user, }
        else
          { error: @user.errors }
        end

    end
      
  end
end