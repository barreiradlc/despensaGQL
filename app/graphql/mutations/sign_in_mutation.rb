module Mutations
    class SignInMutation < Mutations::BaseMutation
      
      argument :attributes, Types::CredentialsInputType, required: true

      field :token, String, null: true
      field :user, Types::UserType, null: true

      def resolve(attributes:)

        if EmailValidator.valid?(attributes[:email])
          @user = User.find_by_email(attributes[:email])
        else
          @user = User.where(username: attributes[:email])
        end

        if @user&.authenticate(attributes[:password])
          token = JsonWebToken.encode(user_id: @user.id)
          time = Time.now + 24.hours.to_i
          {
              token: token,                                                                                                                                                                                                                         
              user: @user
          }
        else
          { error: 'unauthorized' }
        end

    end
      
  end
end