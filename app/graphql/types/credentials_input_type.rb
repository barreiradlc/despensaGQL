module Types
    class CredentialsInputType < Types::BaseInputObject

        argument :username, String, required: false
        argument :email, String, required: false
        argument :password, String, required: false

    end
end