module ApplicationCable
  class Connection < ActionCable::Connection::Base

    identified_by :current_user

    def connect
      self.current_user = current_user
    end

    private

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
end
