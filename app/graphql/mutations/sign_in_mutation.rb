module Mutations
    class SignInMutation < Mutations::BaseMutation
      argument :email, String, required: true
      argument :password, String, required: true
  
      field :token, String, null: true
      field :user, Types::UserType, null: true
  
    #   def resolve(email:, password:)

        

    #     user = User.find_by!(email: email)
    #     return {} unless user
  
    #     token = Base64.encode64(user.email)
    #     {
    #       token: token,
    #       user: user
    #     }
    #   end


      def resolve(email:, password:)
        @user = User.find_by_email(email)
        if @user&.authenticate(password)
            token = JsonWebToken.encode(user_id: @user.id)
            time = Time.now + 300000.hours.to_i
            {
                token: token,
                user: @user
            }
        #   render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
        #                  username: @user.username }, status: :ok
        else
            {
            token: nil,
            user: nil
            }
        #   render json: { error: 'unauthorized' }, status: :unauthorized
        end
      end

      private
  
      def login_params
        params.permit(:email, :password)
      end
      
      end
      
      
  end