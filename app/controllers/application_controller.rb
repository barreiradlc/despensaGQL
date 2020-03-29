class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session

    private

    def current_user
        header = request.headers['Authorization']
        puts header
        header = header.split(' ').last if header
        puts header
        puts 'header -- '
        
    #   puts request.headers["Authorization"].to_h
      
      token = request.headers["Authorization"].to_s
    # token = 'am9obi5kb2VAZXhhbXBsZS5jb20='
      email = Base64.decode64(token)
      User.find_by(email: email)
    end

end