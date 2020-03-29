class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session

    private

    # def current_user

    #     header = request.headers['Authorization']

    #     header = header.split(' ').last if header


    #   token = request.headers["Authorization"].to_s
    # # token = 'am9obi5kb2VAZXhhbXBsZS5jb20='
    #   email = Base64.decode64(token)
    #   User.find_by(email: email)
    # end

    
  def not_found
    render json: { error: 'not_found' }
  end

  def current_user
    header = request.headers['authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
      @current_user
    rescue ActiveRecord::RecordNotFound => e
      # render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      # render json: { errors: e.message }, status: :unauthorized
    end
  end
  
end