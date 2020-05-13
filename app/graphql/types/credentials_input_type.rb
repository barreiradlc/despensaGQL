module Types
    class CredentialsInputType < Types::BaseInputObject

        argument :username, String, required: true
        argument :email, String, required: true
        argument :password, String, required: true

    end
end