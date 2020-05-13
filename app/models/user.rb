class User < ApplicationRecord
   
    has_many :items, dependent: :destroy
    has_many :receitum, dependent: :destroy
    has_many :convites, dependent: :destroy
    
    has_and_belongs_to_many :despensas
     

    has_secure_password
    # mount_uploader :avatar, AvatarUploader
    validates :email, presence: true, uniqueness: { message: 'já pertence a outro usuário'}, format: { with: URI::MailTo::EMAIL_REGEXP, message: "em formato inválido" }
    validates :username, presence: true, uniqueness: { message: 'já pertence a outro usuário'}
    validates :password,
              length: { minimum: 6 },
              if: -> { new_record? || !password.nil? }
end
